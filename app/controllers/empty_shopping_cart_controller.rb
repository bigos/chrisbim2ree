class EmptyShoppingCartController < InheritedResources::Base
  actions :update
  def update
    logger.info "going to empty " + @shopping_cart.inspect
    @shopping_cart.empty!
    redirect_to cart_items_path
  end
end
