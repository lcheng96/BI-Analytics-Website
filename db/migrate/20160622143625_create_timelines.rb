class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.integer :lifecycle

      t.timestamps null: false
    end
  end
end
