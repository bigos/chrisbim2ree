class CommentsController < InheritedResources::Base
  before_filter :require_admin, :only => [:edit, :update, :destroy]
  def create
    
    # create! (:notice => "Your comment has been created and will be shown on this page apon approval") {post_url :id => @comment.post_id}
    @comment = Comment.new(params[:comment])

    if verify_recaptcha(:model => @comment, :message => "Oh! It's error with reCAPTCHA!") 
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @comment, :notice => 'Comment was successfully created and will be displayed after approval.' }
          format.json { render :json => @comment, :status => :created, :location => @comment }
        else
          format.html { render :action => "new" }
          format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end    

  end
  def destroy
    destroy! {
      if @comment.post_id
        post_url :id => @comment.post_id
      else
        comments_url
      end
    }
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
