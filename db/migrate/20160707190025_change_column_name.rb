class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :locations, :site, :institution
  end
end
