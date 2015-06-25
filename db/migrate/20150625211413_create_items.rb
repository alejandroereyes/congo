class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :cost, null: false
      t.string :description
      t.integer :inventory
      t.string :img_url

      t.timestamps null: false
    end
  end
end
