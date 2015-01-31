class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :key
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
