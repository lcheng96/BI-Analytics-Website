class AddLocationIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :location_id, :integer
  end
end
