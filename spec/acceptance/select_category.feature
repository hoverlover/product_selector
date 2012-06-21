Feature: Select Category
  Background:
    Given the following categories:
      | name        |
      | Ferrari     |
      | Lamborghini |
      | Porsche     |
    And the following menu prompt responses:
      | 2     |

  Scenario: Select Category 2
    When I run the system
    Then I am presented with the proper survey
