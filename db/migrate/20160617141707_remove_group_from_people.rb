class RemoveGroupFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :group, :string
  end
end
