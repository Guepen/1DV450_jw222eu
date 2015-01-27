class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :key
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :keys, :users
  end
end
