class Newsletter < ActiveRecord::Base
  attr_accessible :content, :subject

  def deliver_newsletter!
    recipients = NewsletterSubscriber.all.collect{|subscriber| subscriber.email}
    recipients = NewsletterSubscriber.all
    recipients.each do |recipient|
      if recipient.email.index 'jacek'
        logger.info "going to send to " + recipient.email
        NewsletterMailer.newsletter(self, recipient.email).deliver
      end
    end
  end
end
