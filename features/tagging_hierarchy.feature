Feature: Tag Hierarchy
  In order to use tag hierarchy
  As an admin
  I want to make tags become children of other tags

  Background:
    Given the following tags exist:
    | Nature             |
    | Insects            |
    | Odonata            |
    | Dragonflies        |
    | Damselflies        |
    | Landscapes         |
    | England            |
    | Greater Manchester |
    | City Centre        |
    | Salford Quays      |
    | Scotland           |
    | Glen Coe           |
    | Isle of Skye       |

    Given the following photos exist:
    | Wiltshire Sunrise.jpg      |
    | Bird.jpg                   |
    | Bird-bw.jpg                |
    | Devon Beach.jpg            |
    | Devon Beach-bw.jpg         |
    | BBC Media Centre.jpg       |
    | Manchester City Lights.jpg |
    | Piccadilly Gardens.jpg     |
    | Damsefly.jpg               |
    | Two Dragonflies.jpg        |
    | Dragonfly.jpg              |
    
  Scenario: Establishing tag hierarchy
    When I put tag "Insects" as a child of "Nature"
    Then Tag "Insects" should have "Nature" as the parent
    And Tag "Nature" should have "Insects" as one of it's children
    
  Scenario: Setting self as parent
    When I try "Insects" as parent of itself it should not be valid

  Scenario: Tagging Manchester Photos
    When I put following tags as children of:
    | child              | parent             |
    | Greater Manchester | England            |
    | City Centre        | Greater Manchester |
    | Salford Quays      | Greater Manchester |
    And I tag following photos as:
    | BBC Media Centre.jpg       | Salford Quays |
    | Piccadilly Gardens.jpg     | City Centre   |
    | Manchester City Lights.jpg | City Centre   |
    Then following photos should be tagged as:
    | filename               | tag                |
    | Piccadilly Gardens.jpg | City Centre        |
    | Piccadilly Gardens.jpg | Greater Manchester |
    | Piccadilly Gardens.jpg | England            |
    And tags should have following photo counts:
    | England            | 3 |
    | Greater Manchester | 3 |
    | City Centre        | 2 |
    | Salford Quays      | 1 |

  Scenario: Untagging Manchester Photos
    When I put following tags as children of:
    | child              | parent             |
    | Greater Manchester | England            |
    | City Centre        | Greater Manchester |
    | Salford Quays      | Greater Manchester |
    And I tag following photos as:
    | BBC Media Centre.jpg       | Salford Quays |
    | Piccadilly Gardens.jpg     | City Centre   |
    | Manchester City Lights.jpg | City Centre   |
    | Manchester City Lights.jpg | Night         |
    Then tags should have following photo counts:
    | England            | 3 |
    | Greater Manchester | 3 |
    | City Centre        | 2 |
    | Salford Quays      | 1 |
    | Night              | 1 |
    When I remove tag "England" from "Manchester City Lights.jpg"
    Then tags should have following photo counts:
    | England            | 2 |
    | Greater Manchester | 2 |
    | City Centre        | 1 |
    | Salford Quays      | 1 |
    | Night              | 1 |

