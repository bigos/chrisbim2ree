class NewslettersController < InheritedResources::Base
  before_filter :require_admin, :except => :show
  def send_newsletter
    @newsletter = Newsletter.find( params[:id])
    logger.info @newsletter.inspect
    logger.info params.inspect
    @newsletter.deliver_newsletter!
    respond_to do |format|
      format.html { redirect_to newsletters_url }
    end
  end
end
