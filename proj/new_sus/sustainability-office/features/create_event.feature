Feature: Create a new event
  As an admin
  so that I can notify people of upcoming events
  I want to be able to add new events.

  Background: the website already has some existing events
  Given these Events:
    | id | title           |  location        | points | description                     |
    | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
    | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

  Given these users:
      | first_name         | last_name   | role           |
      | John               | Cane        | Faculty        |
      | Thomas             |Smith        | Student        |

  Scenario: Create a new event
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                         |
      | Location      | 40 Broad St                     |
      | Description   | Carbon Footprint Class          |
      | Points        | 3                               |




    When I press "Add this New Event"
    Then I should be on the events page
    And I should see "New event 'Class 2' created"
    And I should see that "Class 2" has a location of "40 Broad St"
    And I should see that "Class 2" has a description of "Carbon Footprint Class"
    And I should see the image "noimg"

  Scenario: Create a new event without a field
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                    |
      | Location      | 40 Broad St                |
      | Description   | Carbon Footprint Class     |


    When I press "Add this New Event"
    Then I should be on the create new event page
    And I should see "Error adding event"
    And I should not see "Class 2"

    Scenario: Create a new event with three occurrences
      Given I am on the create new event page
      When I fill in the following:
        | Title         | Class 2                         |
        | Location      | 40 Broad St                     |
        | Description   | Carbon Footprint Class          |
        | Points        | 3                               |

      When I press "Add this New Event"
      Then I should be on the events page
      And I should see "New event 'Class 2' created"
      And I should see that "Class 2" has a location of "40 Broad St"
      And I should see that "Class 2" has a description of "Carbon Footprint Class"
