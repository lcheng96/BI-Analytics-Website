class AddUpdateRateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :update_rate, :string
  end
end
