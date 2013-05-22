Feature: Unsubscribe from newsletter
  In order to unsubscrribe only myself
  As a subscriber
  I want to unsubscribe

  Background:
    Given there is subscriber "james.bond@examkple.com"
    And his unsubscribe token is "abcd12345"

  Scenario: Successful Unsubscribe
    When I visit link "/unsubscribe/abcd12345?email=james.bond@examkple.com"
    Then subscriber count should be "0"
    And I should get email confirming unsubscription
    And chris should get email confirming unsubscription

  Scenario: Unsuccessful unsubscribe with incorrect token    
    When I visit link "/unsubscribe/zxcv6789?email=james.bond@examkple.com"
    Then subscriber count should be "1"
