require 'factory_girl'

Given(/^there is a test post$/) do
  post = FactoryGirl.create(:post,
                            :title => 'This is a post title',
                            :teaser => 'This is a short post teaser',
                            :content => 'this is a long winded post content with some html in it.')
  # p post
end

When(/^I visit the last post$/) do
  visit "/posts/#{Post.last.id}"
end

Then(/^I should be on last comment page$/) do
  current_path.should == "/comments/#{Comment.last.id}"
end
