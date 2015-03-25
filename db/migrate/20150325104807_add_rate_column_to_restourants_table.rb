class AddRateColumnToRestourantsTable < ActiveRecord::Migration
  def change
    add_column :restourants, :rate, :float
  end
end
