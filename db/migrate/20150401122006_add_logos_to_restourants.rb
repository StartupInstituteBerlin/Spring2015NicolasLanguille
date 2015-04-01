class AddLogosToRestourants < ActiveRecord::Migration
  def change
    add_column :restourants, :logo, :string
  end
end
