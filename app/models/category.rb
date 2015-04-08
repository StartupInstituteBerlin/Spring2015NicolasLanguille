class Category < ActiveRecord::Base
  has_many :restourants

  before_validation :capitalize_name

  validates :name, uniqueness: true, presence: true

  private
    def capitalize_name
      if self.name?
        self.name.capitalize!
      end
    end
end
