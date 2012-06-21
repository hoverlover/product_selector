Feature: List Categories
  Background:
    Given the following categories:
      | name   |
      | Shirts |
      | Shoes  |

  Scenario: Start the system
    When I run the system
    Then I am presented with the list of categories
