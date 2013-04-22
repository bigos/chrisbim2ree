class NewsletterSubscribersController < InheritedResources::Base
  before_filter :require_admin, :except => [:show, :create]
end
