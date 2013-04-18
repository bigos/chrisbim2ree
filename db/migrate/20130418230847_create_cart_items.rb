class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :shopping_cart_id
      t.integer :photo_id
      t.integer :quantity
      t.decimal :price
      t.string :option

      t.timestamps
    end
  end
end
