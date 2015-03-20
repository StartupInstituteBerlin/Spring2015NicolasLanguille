class Restourant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  has_many :ratings

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone, presence: true

end
