Given(/^contact messages count is "(.*?)"$/) do |arg1|
  ContactMessage.count.should eq(arg1.to_i)
end

When(/^fill in contact form with:$/) do |table|
  # table is a Cucumber::Ast::Table
  fill_in('From', :with => table.raw[0][1])
  fill_in('Subject', :with => table.raw[1][1])
  fill_in('Message', :with => table.raw[2][1])
end


Then(/^last contact message should be:$/) do |table|
  message = ContactMessage.last
  message.from.should eq(table.raw[0][1])
  message.subject.should eq(table.raw[1][1])
  message.message.should eq(table.raw[2][1])
end
