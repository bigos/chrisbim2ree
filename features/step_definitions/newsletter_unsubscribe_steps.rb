require 'factory_girl'

FactoryGirl.define do
  factory :newsletter_subscriber do
    email 'me@example.com'
    unsubscribe_token "abcd12345"
  end
end

Given(/^there is subscriber "(.*?)"$/) do |arg1|
  subscriber = FactoryGirl.create(:newsletter_subscriber, 
                                  :email => arg1)                   
end

Given(/^his unsubscribe token is "(.*?)"$/) do |arg1|
  ns = NewsletterSubscriber.first
  ns.unsubscribe_token.should_not be(arg1)
end

When(/^I visit path "(.*?)"$/) do |arg1|
  visit arg1
end
