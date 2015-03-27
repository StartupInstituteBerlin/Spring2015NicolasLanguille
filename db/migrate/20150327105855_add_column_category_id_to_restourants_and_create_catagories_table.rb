class AddColumnCategoryIdToRestourantsAndCreateCatagoriesTable < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    add_column :restourants, :category_id, :integer    
  end
end
