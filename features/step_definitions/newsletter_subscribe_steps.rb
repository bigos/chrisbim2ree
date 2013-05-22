Given(/^subscriber count should be "(.*?)"$/) do |arg1|
  NewsletterSubscriber.count. should be(arg1.to_i)
end

Given(/^I fill in subscription email$/) do
  fill_in('newsletter_subscriber_email', :with => "adam.jones@example.com" )
end

Then(/^unsubscribe token should not be nil$/) do
  ns = NewsletterSubscriber.last
  ns.unsubscribe_token.should_not be(nil)
end
