class ApplicationController < ActionController::Base
  before_filter :initialize_shopping_cart, :remove_old_shopping_carts, :initlialize_workshops
  protect_from_forgery

  helper_method :current_user_session, :current_user, :current_admin

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def current_admin
    if current_user
      if current_user.username == 'admin'
        result = true
      else
        result = false
      end
    else
      result = false
    end
    result
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_admin
    if current_user
      if current_user.username == 'admin'
        return true
      end
    end
    store_location
    flash[:notice] = "You must be logged out to access this page"
    redirect_to account_url
    return false
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def initlialize_workshops
    @workshop_durations = Workshop.pluck(:duration).sort {|x,y| y<=>x}.uniq

  end

  #shopping cart ##############################
  def remove_old_shopping_carts
    objects = ShoppingCart.where("created_at < :week", {:week => 1.week.ago})
    objects.each{|o| o.destroy}
  end

  def initialize_shopping_cart
    if cookies[:shopping_cart]
      @shopping_cart = ShoppingCart.find(:first,:conditions=> ["customer_token=?",cookies[:shopping_cart] ])
      create_shopping_cart if @shopping_cart == nil
    else
      create_shopping_cart
    end
  end

  def create_shopping_cart
    @shopping_cart = ShoppingCart.create
    @hashfunc = Digest::MD5.new
    @hashname = "MD5"
    @hashfunc.update(session.inspect+Time.now.to_s+Time.now.tv_usec.to_s)
    @shopping_cart.customer_token=@hashfunc.hexdigest
    @shopping_cart.save
    cookies[:shopping_cart] = {
      :value => @shopping_cart.customer_token,
      :expires => 24.hours.from_now
    }
    logger.info 'created shopping cart ~~~~~~~~~~~~~~~~' + @shopping.inspect
    #logger.info "XXXXXXXXXXXXXXXX added a cookie #{@shopping_cart.customer_token} XXXXXXXXXXXXXXXXXXXXXXXXX"
  end
end
