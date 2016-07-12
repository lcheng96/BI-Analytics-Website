class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :region
      t.string :site
      t.integer  :tag_id
      t.timestamps null: false
    end
    
    add_index :locations, :tag_id
  end
end
