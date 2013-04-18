class CommentsController < InheritedResources::Base
  before_filter :require_admin, :only => [:edit, :update, :destroy]
end  