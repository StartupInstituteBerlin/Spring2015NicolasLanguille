class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :user_id
      t.integer :restourant_id

      t.timestamps null: false
    end
  end
end
