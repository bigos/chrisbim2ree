Feature: Authentication
  In order to manage my account
  As a registered user
  I want to log in and out

  Background:
    Given the following user exists:
      | username | password |
      | leonard  | secret   |

  Scenario: Successful login
    Given I am not logged in
    And I am on the homepage
    When I follow "Login"
    And I fill in the following:
      | username      | leonard |
      | Password      | secret  |
    And I press "Login"
    Then I should be on the user page
    And I should see "Logout"
    And I should not see "Login"

  Scenario: Successful logout
    Given I am logged in as "leonard"
    And I am on the user page
    When I follow "Logout"
    Then I should be on the homepage
    And I should see "Login"
    And I should not see "Logout"
