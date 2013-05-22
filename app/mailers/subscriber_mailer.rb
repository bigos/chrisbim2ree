class SubscriberMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  default :from => @@secrets['email_server']['user_name']
  
  def welcome_email(subscriber)
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    @subscriber = subscriber
    mail(:to => subscriber.email,
         #:cc => @@secrets['email']['cc'],
         :subject => "Thank You for Registering")
  end

  def new_subscription_admin_notification(subscriber)
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    
    @subscriber = subscriber
    mail(:to => @@secrets['email']['admin_email'],
         #:cc => @@secrets['email']['cc'],
         :subject => "You have new subscriber")
  end

  def goodbye_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.email,
         #:cc => @@secrets['email']['cc'],
         :subject => "Your unsubscription is complete")
  end

  def unsubscribed_admin_notification(subscriber)
    @subscriber = subscriber
    mail(:to => @@secrets['email']['admin_email'],
         #:cc => @@secrets['email']['cc'],
         :subject => "Somebody has unsubscribed")
  end
end
