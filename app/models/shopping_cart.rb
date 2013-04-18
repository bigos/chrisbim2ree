class ShoppingCart < ActiveRecord::Base
  attr_accessible :customer_token

  has_many :cart_items, :dependent => :destroy  

  validates_presence_of :customer_token

end
