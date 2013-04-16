

Given(/^following user does not exist:$/) do |table|
  username = table.raw[0][1]
  User.where(:username => username).first.should be(nil)
end

Then(/^I should get email sent to my address$/) do
  # !!!!! we are not testing emails !!!!!!!!!!!!
  user = User.last
  puts "in real life user #{user.username} will get an email sent to #{user.email}"
  #pending # express the regexp above with the code you wish you had
end

Then(/^I should see activation link in the email$/) do
  user = User.last
  activation_link = "http://localhost:3000/activate/#{user.perishable_token}"
  puts "user will have to follow this link #{activation_link} to activate the account"
  #pending # express the regexp above with the code you wish you had
end

When(/^I visit activation link$/) do
  user = User.last
  activation_link = "http://localhost:3000/activate/#{user.perishable_token}"
  visit activation_link
  #pending # express the regexp above with the code you wish you had
end

Then(/^My account should get activated$/) do
  User.last.active.should eq(true)
end

Then(/^I should see page with my user profile$/) do
  current_url.should include(account_path)
  #pending # express the regexp above with the code you wish you had
end

Then(/^There should be following user:$/) do |table|
  # table is a Cucumber::Ast::Table
  data = table.raw[0]
  #p data
  User.last.username.should eq(data[1])
  #pending # express the regexp above with the code you wish you had
end

Then(/^activated_at field should not be nil$/) do
  User.last.activated_at.should_not be(nil)
end


When(/^I fill in the following registration details:$/) do |table|
  #p table.raw
  #p table.raw[0][1]
  #p table.raw[1][1]
  #p table.raw[2][1]
  #p table.raw[3][1]

  fill_in('Username', :with => table.raw[0][1])
  fill_in('Email', :with => table.raw[1][1])
  
  #fill_in('Password', :with => table.raw[2][1])
  #this gets rid of the field name ambuguity problem
  find('#user_password').set(table.raw[2][1])

  fill_in('Password confirmation', :with => table.raw[2][1])
  
end
