class AddEmailToReservations < ActiveRecord::Migration
  def up
      add_column :reservations, :email, :string
  end

  def down
      remove_column :reservations, :email, :string
  end
end
