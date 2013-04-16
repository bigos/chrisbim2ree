Feature: Contact Form Feature
  In order to leave messages
  As website visitor
  I want to leave a message

  
  Scenario: Successful leaving a message
    Given I am not logged in
    And I am on the homepage
    And contact messages count is "0"
    When I follow "CONTACT"
    And fill in contact form with:
    | from    | james.bond@example.com |
    | subject | secret message         |
    | text    | code 12345             |
    And I press "Submit"
    Then contact messages count is "1"
    And last contact message should be:
    | from    | james.bond@example.com |
    | subject | secret message         |
    | text    | code 12345             |


