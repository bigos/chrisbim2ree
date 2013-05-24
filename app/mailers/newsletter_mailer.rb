class NewsletterMailer < ActionMailer::Base
  if Rails.env == 'development' or  Rails.env == "test" 
    @@url = "http://localhost:3000"
  else
    @@url = "http://www.chrisbeard-photography.co.uk"
  end

  def newsletter(message, email)
    @message = message
    @url = @@url
    subscriber = NewsletterSubscriber.where(:email => email).first
    @unsubscribe_me = @url + subscriber.unsubscribe_path
    mail(:to => email,
         :from => 'enquiries@chrisbeard-images.com',
         :subject => message.subject)
  end
end
