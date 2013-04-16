When(/^I put tag "(.*?)" as a child of "(.*?)"$/) do |arg1, arg2|
  parent = Tag.where(:name => arg2).first
  child = Tag.where(:name => arg1).first
  child.set_parent!(parent)
  child.parent_id.should eq(parent.id)
end

Then(/^Tag "(.*?)" should have "(.*?)" as the parent$/) do |arg1, arg2|
  child = Tag.where(name: arg1).first
  child.parent.name.should eq(arg2)
end

Then(/^Tag "(.*?)" should have "(.*?)" as one of it's children$/) do |arg1, arg2|
  parent = Tag.where(name: arg1).first
  parent.children.collect{|c| c.name}.should include(arg2)
end

When(/^I try "(.*?)" as parent of itself it should not be valid$/) do |arg1|
  child = Tag.where(name: arg1).first
  child.parent_id = child.id
  child.should_not be_valid
end

When(/^I put following tags as children of:$/) do |table|
  table.raw[1..-1].each do |row|
    #p row
    child = Tag.where(:name => row[0]).first
    parent = Tag.where(:name => row[1]).first
    child.set_parent! parent
  end
end

When(/^I tag following photos as:$/) do |table|
  #e = Tag.where(:name => 'England').first
  #p e
  table.raw.each do |row|
    photo = Photo.where(:attachment_file_name => row[0]).first
    #puts 'row '+row.inspect
    #puts 'photo '+photo.inspect
    photo.tag_with! row[1]
    #p photo.tags
    photo.tags.collect{|t| t.name}.should include(row[1])
  end
end

Then(/^following photos should be tagged as:$/) do |table|
  table.raw[1..-1].each do |row|
    photo = Photo.where(:attachment_file_name => row[0]).first  
    photo.tags.collect{|t| t.name}.should include(row[1])
    # p photo.tags.collect{|t| t.name}
  end
end

Then(/^tags should have following photo counts:$/) do |table|
  table.raw.each do |row|
    tag = Tag.where(:name => row[0]).first
    #p row
    #p tag.photo_count
    tag.photo_count.should eq(row[1].to_i)
  end
end

When(/^I remove tag "(.*?)" from "(.*?)"$/) do |arg1, arg2|
  photo = Photo.where(:attachment_file_name => arg2).first
  photo.recursively_remove_tag(arg1)
end
