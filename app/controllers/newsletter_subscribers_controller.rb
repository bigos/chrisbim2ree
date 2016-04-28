class NewsletterSubscribersController < InheritedResources::Base
  before_filter :require_admin, :except => [:show, :create]

  def create
    @request = request
    @newsletter_subscriber = NewsletterSubscriber.new(params[:newsletter_subscriber])
    # not working in production
    # does it record ip of nginx ?
    logger.info "/n/n/nip stuff"
    logger.info request.env.inspect
    logger.info "/n/n/n"
    byebug
    @newsletter_subscriber.subscriber_ip = request.env["HTTP_X_FORWARDED_FOR"]

    create!
  end
end
