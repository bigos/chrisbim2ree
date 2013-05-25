class NewsletterMailer < ActionMailer::Base

  def newsletter(message, email)
    @message = message
    @url = "http://chrisbeard-images.com"
    subscriber = NewsletterSubscriber.where(:email => email).first
    @unsubscribe_me = @url + subscriber.unsubscribe_path
    mail(:to => email,
         :from => 'enquiries@chrisbeard-images.com',
         :subject => message.subject)
  end
end
