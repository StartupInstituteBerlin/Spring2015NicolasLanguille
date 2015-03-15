class Restourant < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone, presence: true

end
