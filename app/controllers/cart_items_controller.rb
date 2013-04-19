class CartItemsController < InheritedResources::Base
  actions :all, :except => [ :new]
  def index
    if current_admin
      @cart_items = CartItem.all
    else
      @cart_items = CartItem.where(:shopping_cart_id => @shopping_cart.id)
    end
    index!
  end
end
