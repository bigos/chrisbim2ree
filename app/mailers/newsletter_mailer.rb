class NewsletterMailer < ActionMailer::Base
  if Rails.env == 'development' or  Rails.env == "test" 
    @@url = "http://localhost:3000"
  else
    @@url = "http://www.chrisbeard-photography.co.uk"
  end

  def newsletter(message, email)
    @message = message
    @url = @@url
    mail(:to => email,
         :from => 'enquiries@chrisbeard-images.com',
         :subject => message.subject)
  end
end
