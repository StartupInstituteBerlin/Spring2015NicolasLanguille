class AddAssociationUserRestourants < ActiveRecord::Migration
  def up
    add_column :restourants, :user_id, :integer
  end

  def down
    remove_column :restourants, :user_id
  end

end
