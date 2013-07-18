class CommentsController < InheritedResources::Base
  before_filter :require_admin, :only => [:edit, :update, :destroy]
  def create
    
    create! (:notice => "Your comment has been created and will be shown on this page apon approval") {post_url :id => @comment.post_id}
  end
  def destroy
    destroy! {post_url :id => @comment.post_id}
  end
  def publish
    @comment = Comment.find params[:id]
    @comment.published = true
    @comment.save
    redirect_to post_url(@comment.post)
  end
  def unpublish
    @comment = Comment.find params[:id]
    @comment.published = false
    @comment.save
    redirect_to post_url(@comment.post)
  end
end  
