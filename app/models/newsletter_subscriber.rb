class NewsletterSubscriber < ActiveRecord::Base
  attr_accessible :email, :unsubscribe_token

  before_create :set_unsubscribe_token_if_blank
  after_create :deliver_email_notifications
  
  def set_unsubscribe_token_if_blank
    require 'digest/md5'
    if self.unsubscribe_token == nil
      self.unsubscribe_token = Digest::MD5.hexdigest(email + Time.now.to_s)
    end
  end

  private  
  def deliver_email_notifications
    SubscriberMailer.welcome_email(self).deliver
    SubscriberMailer.admin_notification(self).deliver
  end
end
