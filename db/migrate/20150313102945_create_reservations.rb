class CreateReservations < ActiveRecord::Migration
  def up
    create_table :reservations do |t|
      t.string :last_name
      t.datetime :datetime
      t.integer :no_people
      t.integer :restourant_id

      t.timestamps null: false
    end
  end

  def down
    drop_table :reservations

  end

end
