class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restourant

  validates :user_id, presence: true
  validates :restourant_id, presence: true
  validates :value, presence: true

  before_validation :owner?

  def evaluate_restourant_rate
    restourant_ratings = Rating.where(restourant_id: self.restourant_id)

    rate_sum = restourant_ratings.sum(:value)
    average = rate_sum.to_f/restourant_ratings.count.to_f

    restourant = Restourant.find(self.restourant_id)
    restourant.rate = average
    restourant.save

    #puts "\n\n\naverage: #{average}"
    #puts "\n\n\nrest value: #{restourant.rate}\n\n\n"
  end

  private

    def owner?
      owner = User.where(id: self.user_id, role_name: "owner").exists?

      self.errors.add("user_id","cannot be an owner") if owner
    end

end
