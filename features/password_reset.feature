Feature: Password Reset
  In order to retrieve a lost password
  As a user of this site
  I want to reset it

  Scenario: Reset password
    Given a user exists with email: "user@domain.com", password: "password" and username: "test_user"
    And I am not logged in
    And I am on the homepage
    When I follow "Login"

    And I follow "I forgot my password"
    Then I should see text "Reset Password"
    And I should see text "Please enter your email address below"
    When I fill in "email" with "user@domain.com"
    And I press "Reset Password"  

    Then I should see password change link in the email
    When I follow Reset Password link in the email
    When I fill in xpath "password" with "newpassword"
    When I fill in xpath "password_confirmation" with "newpassword"    
    And I press "Update Password"
    When I am not logged in
    Then I should be able to log in with username "test_user" and password "newpassword"

  Scenario: Reset password no account
    Given I am not logged in
    And I am on the homepage
    When I follow "Login"

    And I follow "I forgot my password"
    Then I should see text "Reset Password"
    And I should see text "Please enter your email address below"
    When I fill in "email" with "nonexistent_user@domain.com"
    And I press "Reset Password"
    Then I should see text "No user was found with email address nonexistent_user@domain.com" 
