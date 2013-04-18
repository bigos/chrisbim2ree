class CreateShoppingCarts < ActiveRecord::Migration
  def change
    create_table :shopping_carts do |t|
      t.string :customer_token

      t.timestamps
    end
  end
end
