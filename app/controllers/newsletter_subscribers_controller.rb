class NewsletterSubscribersController < InheritedResources::Base
  before_filter :require_admin, :except => [:show, :create]

  def create
    @request = request
    @newsletter_subscriber = NewsletterSubscriber.new(params[:newsletter_subscriber])
    @newsletter_subscriber.subscriber_ip = request.remote_addr
    create!
  end
end
