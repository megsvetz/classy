class ChangePriceColumnInItems < ActiveRecord::Migration
  def change
    change_column :items, :price, :decimal, precision: 6, scale: 2
  end
end
