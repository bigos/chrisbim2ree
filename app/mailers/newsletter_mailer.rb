class NewsletterMailer < ActionMailer::Base
  if Rails.env == 'development' or  Rails.env == "test" 
    @@url = "http://localhost:3000"
  else
    @@url = "http://www.chrisbeard-photography.co.uk"
  end

  def newsletter(message)
    @message = message
    @url = @@url
    recipients = NewsletterSubscribers.all
    recipients.each do |recipient|
      mail(:to => recipient.email,
           :from => 'enquiries@chrisbeard-images.com'
           :subject => message.subject)
    end
  end
end
