Feature: Complete Survey
  Background:
    Given the following category:
      | name | Ferrari |
    And that category has the following products:
      | name        | color  |
      | 355 Spider  | red    |
      | 458 Italia  | yellow |
    And the following category:
      | name | Lamborghini |
    And that category has the following products:
      | name         | color  |
      | Gallardo     | orange |
      | 458 Reventon | black  |
    And the following category:
      | name | Porsche |
    And that category has the following products:
      | name   | color |
      | 928    | white |
      | Cayman | black |

  Scenario: With matching products
    When the following menu prompt responses are used:
      | 2     |
      | black |
    And I run the system
    Then the survey results are saved to the database
    And only the matching products are displayed

  Scenario: With no matching products
    When the following menu prompt responses are used:
      | 1    |
      | pink |
    And I run the system
    Then the survey results are saved to the database
    And no matching products are displayed
