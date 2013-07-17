class CommentMailer < ActionMailer::Base
  @@secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
  @@url  = "http://chrisbeard-images.com"
  default :from => @@secrets['email_server']['user_name']
  
  def new_comment_admin_notification(comment)
    @comment = comment
    mail(:to => @@secrets['email']['admin_email'],
         #:cc => @@secrets['email']['cc'],
         :subject => "You have new comment")
  end
end
