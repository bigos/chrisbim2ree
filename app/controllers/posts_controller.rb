class PostsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index, :show]
end
