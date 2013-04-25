class WorkshopsController < InheritedResources::Base
  before_filter :require_admin, :except => [:index, :show]
  def index
    if params[:duration]
      @workshops = Workshop.where(:duration => params[:duration])
    else
      @workshops = Workshop.find(:all)
    end
    index!
  end
end
