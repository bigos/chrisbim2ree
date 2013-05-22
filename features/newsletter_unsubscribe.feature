Feature: Unsubscribe from newsletter
  In order to unsubscrribe only myself
  As a subscriber
  I want to unsubscribe

  Background:
    Given there is subscriber "james.bond@examkple.com"
    And his unsubscribe token is "abcd12345"

  Scenario: Successful Unsubscribe
    When I visit path "/unsubscribe/abcd12345?email=james.bond@examkple.com"
    Then subscriber count should be "0"

  Scenario: Unsuccessful unsubscribe with incorrect token    
    When I visit path "/unsubscribe/zxcv6789?email=james.bond@examkple.com"
    Then subscriber count should be "1"
