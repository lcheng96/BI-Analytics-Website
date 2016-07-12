class AddPersonIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :person_id, :integer
  end
end
