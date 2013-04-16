class ContactMessage < ActiveRecord::Base
  attr_accessible :from, :message, :subject
end
