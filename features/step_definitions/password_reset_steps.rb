require 'factory_girl'


Given(/^a user exists with email: "(.*?)", password: "(.*?)" and username: "(.*?)"$/) do |arg1, arg2, arg3|
  

  FactoryGirl.define do
    factory :user do
      username arg3
      email arg1
      password arg2
      password_confirmation arg2
      active true
    end
  end
  user = FactoryGirl.create(:user) 
  p user
end

Then(/^I should see text "(.*?)"$/) do |arg1|
  #!!! this works for case of multiple occurences of text!!!
  find('body').has_content? arg1
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  find_field(arg1).set(arg2)
end

When(/^I fill in xpath "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  find(:xpath, "//*[@id=\"#{arg1}\"]").set(arg2)
end

Then(/^I should see password change link in the email$/) do
  user = User.last
  pass_reset="http://localhost:3000/password_resets/#{user.perishable_token}/edit"
  puts "user will have to follow #{pass_reset} to reset his password"
end

When(/^I follow Reset Password link in the email$/) do
  user = User.last
  pass_reset_link="http://localhost:3000/password_resets/#{user.perishable_token}/edit"
  visit pass_reset_link
end

Then(/^I should be able to log in with username "(.*?)" and password "(.*?)"$/) do |arg1, arg2|
  visit root_path
  click_link "Login"
  fill_in('Username', :with => arg1)
  fill_in('Password', :with => arg2)
  click_button('Login')
  #puts page.body
  current_path.should == "/account"
end
