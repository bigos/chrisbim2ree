class NewslettersController < InheritedResources::Base
  before_filter :require_admin
  def send_newsletter
    logger.info params.inspect
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
