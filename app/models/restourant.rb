class Restourant < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :reservations
  has_many :ratings

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone, presence: true

  mount_uploader :logo, LogoUploader

  def rated?
    self.rate != nil 
  end

end
