class ShoppingCart < ActiveRecord::Base
  attr_accessible :customer_token

  has_many :cart_items, :dependent => :destroy  

  validates_presence_of :customer_token

  def empty!
    self.cart_items.each do |cart_item|
      logger.info 'deleted ' + cart_item.inspect
      cart_item.destroy
    end
  end
end
