class NewsletterSubscriber < ActiveRecord::Base
  attr_accessible :email, :unsubscribe_token

  validates :email, :uniqueness => { :case_sensitive => false,
                                     :message => 'already subscribed'
                                   }

  validates :email, :presence => true

  before_create :set_unsubscribe_token_if_blank
  after_create :new_subscription_notifications

  def set_unsubscribe_token_if_blank
    require 'digest/md5'
    if self.unsubscribe_token == nil
      self.unsubscribe_token = Digest::MD5.hexdigest(email + Time.now.to_s)
    end
  end

  def unsubscribe_path
    "/unsubscribe/#{self.unsubscribe_token}?email=#{self.email}"
  end

  def unsubscription_notifications
    SubscriberMailer.goodbye_email(self).deliver
    SubscriberMailer.unsubscribed_admin_notification(self).deliver
  end

  private
  def new_subscription_notifications
    SubscriberMailer.welcome_email(self).deliver
    SubscriberMailer.new_subscription_admin_notification(self).deliver
  end

end
