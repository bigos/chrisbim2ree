class TagsController < InheritedResources::Base

  def show
    @tag = Tag.find(params[:id])
    if current_admin
      if params[:pin]
        @tag.photo_id = params[:pin]
        @tag.save
      end
    end
    # @category_photo = @tag.photo
    @photos = Photo.includes(:tags).where(:tags => {:name => @tag.name})
    @untagged_photos = []
    Photo.all.each do |p|
      @untagged_photos << p if p.tags.count == 0
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tag }
    end
  end
end
