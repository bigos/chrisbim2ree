Feature: UserRegistrationAndActivation
  In order to register
  As a website visitor
  I want to register and activate my account

  Background:
    Given following user does not exist:
    | username | james_bond |

  Scenario: Successful registration
    Given I am not logged in
    And I am on the homepage
    When I follow "Login"
    And I follow "Register"
    And I fill in the following registration details:
      | username      | james_bond |
      | email         | user007@example.com |
      | Password      | secret  |
      | Password confirmation | secret |
    And I press "Register"
    Then I should get email sent to my address
    And I should see activation link in the email
    And There should be following user:
    | username | james_bond |
    When I visit activation link
    Then My account should get activated
    And activated_at field should not be nil
    And I should see page with my user profile
