class PostsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index, :show]
  def index
    @posts = Post.order('created_at DESC')
    index!
  end
end
