class NewsletterSubscriber < ActiveRecord::Base
  attr_accessible :email

  after_create :deliver_email_notifications

  private
  def deliver_email_notifications
    SubscriberMailer.welcome_email(self).deliver
    SubscriberMailer.admin_notification(self).deliver
  end
end
