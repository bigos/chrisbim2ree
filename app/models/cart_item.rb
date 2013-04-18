class CartItem < ActiveRecord::Base
  attr_accessible :option, :photo_id, :price, :quantity, :shopping_cart_id
end
