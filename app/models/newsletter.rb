class Newsletter < ActiveRecord::Base
  attr_accessible :content, :subject

  def deliver_newsletter_to_all!(mode)
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

  def deliver_newsletter(email)
    logger.info "going to send to " + email
    NewsletterMailer.newsletter(self, email).deliver
  end
end
