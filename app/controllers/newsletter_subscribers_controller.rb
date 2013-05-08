class NewsletterSubscribersController < InheritedResources::Base
  before_filter :require_admin, :except => [:show, :create]
  
  def create
    create!
  end
end
