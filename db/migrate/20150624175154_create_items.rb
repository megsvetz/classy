class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price, :scale => 2
      t.text :description 
      t.integer :cat_id
      t.timestamps null: false
    end
  end
end
