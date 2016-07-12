class RemoveTimelineFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :timeline, :integer
  end
end
