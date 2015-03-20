class Rating < ActiveRecord::Base
  belongs_to :users
  belongs_to :restourants

  validates :user_id, presence: true
  validates :restourant_id, presence: true 
end
