class ContactMessagesController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :show]
end
