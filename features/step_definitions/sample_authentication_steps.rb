require 'factory_girl'

Given(/^the following user exists:$/) do |table|
  data = table.raw[1]
  #p data

  # it fixes following error
  # Factory already registered: user (FactoryGirl::DuplicateDefinitionError)
  FactoryGirl.factories.clear

  FactoryGirl.define do
    factory :user do
      username data[0]
      password data[1]
      active true
      email "user@example.com"
      password_confirmation data[1]
    end
  end
  user = FactoryGirl.create(:user)  
  #p user
end

Given(/^I am not logged in$/) do
  UserSession.find.try(:destroy)
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I follow "(.*?)"$/) do |arg1|
  click_link arg1
end

When(/^I fill in the following:$/) do |table|
  data = table.raw
  fill_in('Username', :with => data[0][1])
  fill_in('Password', :with => data[1][1])
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button(arg1)
end

Then(/^I should be on the user page$/) do
  current_path.should == "/account"
end

Then(/^I should see "(.*?)"$/) do |arg1|
  find_link( arg1)
end

Then(/^I should not see "(.*?)"$/) do |arg1| 
  expect {  find_link(arg1) }.to raise_error
end

Given(/^I am logged in as "(.*?)"$/) do |arg1|
  UserSession.find.record.username.should == arg1
end

Given(/^I am on the user page$/) do
  visit account_path
  current_path.should == "/account"
end

Then(/^I should be on the homepage$/) do
  current_path.should == root_path
end
