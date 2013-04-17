class UserMailer < ActionMailer::Base
  default :from => "from@example.com"

  def welcome_email(user)
    @user = user

    mail(:to => user.email, 
         :from => "chris@chrisbeard-images.com",
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
         :from => "chris@chrisbeard-images.com",
         :subject => "Activation Instructions")
  end

  def password_reset_instructions(user)
   if Rails.env == 'development' or  Rails.env == "test" 
      @url = "http://localhost:3000"
    else
      @url  = "http://www.chrisbeard-photography.co.uk"
    end
    @reset_path = edit_password_reset_path(user.perishable_token)
    mail(:to => user.email,
         :from => "chris@chrisbeard-images.com",
         :subject => "Password Reset Instructions")
    
  end
end
