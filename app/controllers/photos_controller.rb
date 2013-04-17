class PhotosController < InheritedResources::Base
  # GET /photos
  # GET /photos.json
  def index

    if params[:tag]
      @photos = Photo.includes(:tags).where(:tags => {:name => params[:tag]}).order('photos.created_at DESC').paginate(:page => params[:page], :per_page => 12)
    else
      @photos = Photo.order('created_at DESC').paginate(:page => params[:page], :per_page => 12) 
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @photos }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    if current_user
      if current_user.username == 'admin'
        if params[:add_tag]
          @photo.tag_with! params[:add_tag]
        end
        if params[:remove_tag]
          @photo.recursively_remove_tag params[:remove_tag]
        end
      else
      flash[:error] = 'Error: Only admin can do that.' 
      end
    else
      flash[:error] = 'Error: You need to log in as admin to do that.' 
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { render :json => [@photo.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        #format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :json => {:files => [@photo.to_jq_upload] }}
      else
        format.html { render :action => "new" }
        format.json { render :json => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

end
