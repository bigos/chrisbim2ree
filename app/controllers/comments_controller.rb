class CommentsController < InheritedResources::Base
  before_filter :require_admin, :only => [:edit, :update, :destroy]
  def create
    create! {post_url :id => @comment.post_id}
  end
  def destroy
    destroy! {post_url :id => @comment.post_id}
  end
end  
