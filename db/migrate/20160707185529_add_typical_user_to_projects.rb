class AddTypicalUserToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :typical_user, :string
  end
end
