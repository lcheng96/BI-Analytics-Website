class AddGroupToPeople < ActiveRecord::Migration
  def change
    add_column :people, :group, :integer
  end
end
