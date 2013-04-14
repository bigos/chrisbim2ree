class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :email

  acts_as_authentic

  def activate!
    self.activated_at = Time.now
    self.active = true
    save
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    UserMailer.activation_instructions(self).deliver
  end

  def deliver_welcome!
    reset_perishable_token!
    UserMailer.welcome_email(self).deliver
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.password_reset_instructions(self).deliver
  end
end
