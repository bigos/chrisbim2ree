Feature: Comments to posts
  In order to test is
  As a visitor
  I want to leave a comment

Background:
  Given there is a test post

Scenario: Leaving a comment
  When I visit the last post
  And I should not see "This is a test comment"
  And I fill in xpath "comment_content" with "This is a test comment"
  And I press "Submit Comment"
  Then I should be on last post page
  And I should see text "This is a test comment"
