class CartItem < ActiveRecord::Base
  attr_accessible :option, :photo_id, :price, :quantity, :shopping_cart_id

  belongs_to :shopping_cart
  belongs_to :photo

  validates_presence_of :shopping_cart_id, :photo_id, :quantity, :option, :price
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 1

  # options price size
  OPTIONS = [[96, 'A3'], [50, 'A4']]

  before_validation :set_price

  private
  def set_price
    OPTIONS.each do |opt|
      if self.option == opt[1]
        self.price = opt[0]
      end
    end
  end
end
