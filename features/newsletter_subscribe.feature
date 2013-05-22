Feature: Subscribe to the newsletter
  In order to subscrribe
  As a visitor
  I want to subscribe

  Background:
    Given subscriber count should be "0"

  Scenario: Successful subscription
    Given I am on the homepage
    And I fill in subscription email
    And I press "Subscribe"
    Then subscriber count should be "1"
    And unsubscribe token should not be nil
