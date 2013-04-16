require 'factory_girl'

Given(/^the following tags exist:$/) do |table|
  table.raw.each do |el|
    #p el[0]
    t = FactoryGirl.create(:tag, name: el[0]) 
    #p t
  end
  ta = Tag.all
  ta.count.should be(table.raw.size)
end

Given(/^the following photos exist:$/) do |table|
  table.raw.each do |el|
    FactoryGirl.create(:photo, attachment_file_name: el[0]) 
  end
  Photo.all.count.should be(table.raw.size)
end

When(/^I tag "(.*?)" as "(.*?)"$/) do |arg1, arg2|
  photo = Photo.where(:attachment_file_name => arg1).first
  photo.tag_with! arg2  
end

Then(/^the photo "(.*?)" should include tag "(.*?)"$/) do |arg1, arg2|
  photo = Photo.where(:attachment_file_name => arg1).first
  photo.tag_list.should include( arg2)
end

Then(/^tag count of photo "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  photo = Photo.where(:attachment_file_name => arg1).first
  photo.tags.count.should be(arg2.to_i)
end

Then(/^tag count should be "(.*?)"$/) do |arg1|
  Tag.all.count.should be(arg1.to_i)
end

When(/^I remove tag "(.*?)" from photo "(.*?)"$/) do |arg1, arg2|
  photo = Photo.where(:attachment_file_name => arg2).first
  photo.remove_tag arg1
end

When(/^I destroy photo "(.*?)"$/) do |arg1|
  photo = Photo.where(:attachment_file_name => arg1).first
  photo.destroy
end

Then(/^total tag count should be "(.*?)"$/) do |arg1|
  Tag.all.count.should eq(arg1.to_i)
end

Then(/^total tagging count should be "(.*?)"$/) do |arg1|
  Tagging.all.count.should eq(arg1.to_i)
end
