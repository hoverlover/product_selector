Feature: Complete Survey
  Background:
    Given the following categories:
      | name        |
      | Ferrari     |
      | Lamborghini |
      | Porsche     |
    And the following menu prompt responses:
      | 2     |
      | black |

  Scenario: Complete the survey
    When I run the system
    Then the survey results are saved to the database
