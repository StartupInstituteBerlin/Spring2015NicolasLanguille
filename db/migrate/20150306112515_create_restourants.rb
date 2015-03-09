class CreateRestourants < ActiveRecord::Migration
  def up
    create_table :restourants do |t|
      t.string :name
      t.text :description
      t.text :address, presence: true
      t.string :phone, presence: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :restourants
  end
end
