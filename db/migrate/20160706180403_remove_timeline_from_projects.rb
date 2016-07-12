class RemoveTimelineFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :timeline, :integer
  end
end
