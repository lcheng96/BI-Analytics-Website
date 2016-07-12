class AddExternalViewToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :external_view, :boolean
  end
end
