class Reservation < ActiveRecord::Base
  belongs_to :restourant, foreign_key: :restourant_id

end
