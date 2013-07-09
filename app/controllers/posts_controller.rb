class PostsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index, :show]
  def index
    if current_admin
      @posts = Post.order('created_at DESC')
    else
      @posts = Post.where(:published => true).order('created_at DESC')
    end
    index!
  end
  def publish
    @post = Post.find params[:id]
    @post.published = true
    @post.save
    redirect_to posts_url
  end
end
