class Newsletter < ActiveRecord::Base
  attr_accessible :content, :subject

  def deliver_newsletter!(mode)
    recipients = NewsletterSubscriber.all.collect{|subscriber| subscriber.email}
    recipients = NewsletterSubscriber.all
    recipients.each do |recipient|
      if mode == 'test'
        if recipient.email.index('jacek') or (recipient.email.index('chris') and recipient.email.index('beard'))
          logger.info "going to send to " + recipient.email
          NewsletterMailer.newsletter(self, recipient.email).deliver
        end
      else
        logger.info "going to send to " + recipient.email
        NewsletterMailer.newsletter(self, recipient.email).deliver
      end
    end
  end
end
