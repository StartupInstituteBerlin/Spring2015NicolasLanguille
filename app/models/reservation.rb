class Reservation < ActiveRecord::Base
  belongs_to :restourant, foreign_key: :restourant_id
  belongs_to :user, foreign_key: :user_id

  validates :last_name, presence: true
  validates :email,     presence: true
  validates :no_people, presence: true,
                        numericality: { only_integer: true,
                                        greater_than: 0,
                                        less_than: 15
                                        }
  validates :datetime,  presence: true

end
