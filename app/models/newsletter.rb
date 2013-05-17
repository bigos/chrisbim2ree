class Newsletter < ActiveRecord::Base
  attr_accessible :content, :subject

  def deliver_newsletter!
    NewsletterMailer.newsletter(self).deliver
  end
end
