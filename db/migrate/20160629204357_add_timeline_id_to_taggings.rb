class AddTimelineIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :timeline_id, :integer
  end
end
