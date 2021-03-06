class TagsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index]
  autocomplete :tag, :category_name, :full => true, :scopes => [:uniquely_named]

  def index
    if params[:tag]
      tag = Tag.first(:conditions => {:name => params[:tag]})
      @tags = tag.children
    else
      @tags = Tag.where(:parent_id => nil).order(:name)
    end
    index!
  end

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
    @untagged_photos.sort! {|x,y| x.attachment_file_name <=> y.attachment_file_name}
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @tag }
    end
  end
end
