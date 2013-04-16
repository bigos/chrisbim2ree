class SlidesController < InheritedResources::Base

  # GET /slides
  # GET /slides.json
  def index
    logger.info params.inspect
    if params[:toggle_activation]
      slide = Slide.where(:id => params[:toggle_activation]).first
      logger.info slide
      slide.toggle_visibility!
      slide.save
    end
    if params[:up]
      slide = Slide.where(:position => params[:up]).first
      if slide.position > 1
        other_slide = Slide.where(:position => slide.position-1).first
        other_slide.increment :position
        slide.decrement :position
        other_slide.save
        slide.save
        slide.reorder_positions!
      end
    end
    if params[:down]
      slide = Slide.where(:position => params[:down]).last
      logger.info "found slide #{slide.inspect}"
      if slide.position < Slide.where(:visible => true).count
        other_slide = Slide.where(:position => slide.position+1).first
        other_slide.decrement :position
        slide.increment :position
        other_slide.save
        slide.save
        slide.reorder_positions!
      end
    end

    @slides = Slide.find( :all, :order => "visible DESC, position ASC")
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @slides }
    end
  end

end
