class Reservation < ActiveRecord::Base
  belongs_to :restourant, foreign_key: :restourant_id
  belongs_to :user, foreign_key: :user_id

end
