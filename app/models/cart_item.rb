class CartItem < ActiveRecord::Base
  attr_accessible :option, :photo_id, :price, :quantity, :shopping_cart_id

  belongs_to :shopping_cart
  validates_presence_of :shopping_cart_id, :photo_id, :quantity, :option
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1
end
