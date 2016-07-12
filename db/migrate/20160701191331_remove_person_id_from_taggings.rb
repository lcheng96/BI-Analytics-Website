class RemovePersonIdFromTaggings < ActiveRecord::Migration
  def change
    remove_column :taggings, :Person, :integer
  end
end
