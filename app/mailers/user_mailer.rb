class UserMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  default :from => @@secrets['email'][Rails.env]['sender']

  def contact_form_message(message)
    @message = message
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    mail(:to => @@secrets['email'][Rails.env]['sender'],
         :from => @message.from,
         :subject => @message.subject)
  end
  
  def welcome_email(user)
    @user = user

    mail(:to => user.email,
         :subject => "Welcome to My Awesome Site")
  end

  def activation_instructions(user)
    @user = user
    if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000/"
    else
      @url  = "http://www.chrisbeard-photography.co.uk/"
    end
    @activation_path = "activate/#{user.perishable_token}"
    mail(:to => user.email,
         :subject => "Activation Instructions")
  end

  def password_reset_instructions(user)
   if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    @reset_path = edit_password_reset_path(user.perishable_token)

    sender = 

    mail(:to => user.email,
         :subject => "Password Reset Instructions")
    
  end
end
