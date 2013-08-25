class NewslettersController < InheritedResources::Base
  before_filter :require_admin, :except => :show
  def send_newsletter_to_all
    @newsletter = Newsletter.find( params[:id])
    logger.info @newsletter.inspect
    logger.info params.inspect
    mode = params[:mode]
    @newsletter.deliver_newsletter_to_all! mode
    respond_to do |format|
      format.html { redirect_to newsletters_url }
    end
  end

  def send_newsletter
    @newsletter = Newsletter.find( params[:id])
    logger.info @newsletter.inspect
    logger.info params.inspect
    email = NewsletterSubscriber.where(:id => params[:newsletter_subscriber_id]).first.email
    @newsletter.deliver_newsletter(email)
    respond_to do |format|
      format.html { redirect_to newsletters_url }
    end
  end
end
