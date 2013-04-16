class ContactMessage < ActiveRecord::Base
  attr_accessible :from, :message, :subject

  validates_presence_of :from, :message, :subject
  validates_format_of :from, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, :message => "Invalid! email address."
end
