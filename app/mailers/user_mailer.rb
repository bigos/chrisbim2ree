class UserMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  if Rails.env == 'development' or  Rails.env == "test" 
    @@url = "http://localhost:3000"
  else
    @@url = "http://www.chrisbeard-photography.co.uk"
  end
  default :from => @@secrets['email']['sender']

  def contact_form_message(message)
    @message = message
    @url = @@url
    mail(:to => @@secrets['email']['user_name'],
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
    @url = @@url
    @activation_path = "activate/#{user.perishable_token}"
    mail(:to => user.email,
         :subject => "Activation Instructions")
  end

  def password_reset_instructions(user)
    @url = @@url
    @reset_path = edit_password_reset_path(user.perishable_token)
    mail(:to => user.email,
         :subject => "Password Reset Instructions")    
  end
end
