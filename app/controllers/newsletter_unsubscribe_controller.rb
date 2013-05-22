class NewsletterUnsubscribeController < ApplicationController
  def unsubscribe
    logger.info params.inspect
    @subscriber = NewsletterSubscriber.where(:unsubscribe_token => params[:unsubscribe_token], :email => params[:email]).first
    logger.info @subscriber.inspect
    if @subscriber
      @email = @subscriber.email
      @subscriber.destroy
    end
  end
end
