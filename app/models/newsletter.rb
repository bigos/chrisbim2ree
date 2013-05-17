class Newsletter < ActiveRecord::Base
  attr_accessible :content, :subject

  def deliver_newsletter!
    recipients = NewsletterSubscriber.all.collect{|subscriber| subscriber.email}
    # once everything is tested remove below dummy data
    secrets = YAML.load_file( "#{ Rails.root}/config/secret.yml")
    recipients = [
                  secrets['test_recipients']['recipient1'],
                  secrets['test_recipients']['recipient2']
                 ]
    recipients.each do |recipient|
      logger.info "going to send to " + recipient
      NewsletterMailer.newsletter(self, recipient).deliver
    end
  end
end
