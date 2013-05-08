class SubscriberMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  default :from => @@secrets['email'][Rails.env]['sender']
  
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.email,
         :subject => "Thank you for subscription")
  end

  def admin_notification(subscriber)
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    
    @subscriber = subscriber
    mail(:to => @@secrets['email']['production']['user_name'],
         :subject => "You have new subscriber")
  end
end
