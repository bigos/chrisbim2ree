class SubscriberMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  default :from => @@secrets['email']['sender']
  
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.email,
         #:cc => @@secrets['email']['cc'],
         :subject => "Thank You for Registering")
  end

  def admin_notification(subscriber)
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    
    @subscriber = subscriber
    mail(:to => @@secrets['email']['user_name'],
         #:cc => @@secrets['email']['cc'],
         :subject => "You have new subscriber")
  end
end
