Given(/^subscriber count should be "(.*?)"$/) do |arg1|
  NewsletterSubscriber.count. should be(arg1.to_i)
end

Given(/^I fill in subscription email$/) do
  fill_in('newsletter_subscriber_email', :with => "adam.jones@example.com" )
end
