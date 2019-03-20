Feature: Create a new event
  As an admin
  so that I can notify people of upcoming events
  I want to be able to add new events.

  Background: the website already has some existing events
    Given these Events:
      | title           | id | location        | recurring | points | description                     |
      | Class 1         | 1  | Persson 108     | yes       |    3   | Recycling Class                 |
      | Non-recurring 1 | 2  | Love Auditorium | no        |    1   | Guest Speaker on Global Warming |

    Given these Occurrences:
      | event_id | date_time                  |
      | 1        | October 30, 2018 04:30 PM  |
      | 2        | November 2, 2018 07:00 PM  |

  Scenario: Create a new event
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                         |
      | Location      | 40 Broad St                     |
      | Description   | Carbon Footprint Class          |
      | Points value  | 3                               |

    When I check "Is this a recurring event?"
    When I select "December 4, 2018 05:00 PM" as the first datetime

    When I press "Add this New Event"
    Then I should be on the events page
    And I should see "New event 'Class 2' created"
    And I should see that "Class 2" has a location of "40 Broad St"
    And I should see that "Class 2" has a description of "Carbon Footprint Class"
    And I should see that "Class 2" has a date_time of "December 4, 2018 05:00 PM"
    And I should see the image "noimg"

  Scenario: Create a new event without a field
    Given I am on the create new event page
    When I fill in the following:
      | Title         | Class 2                    |
      | Location      | 40 Broad St                |
      | Description   | Carbon Footprint Class     |

    When I select "November 10, 2018 05:30 PM" as the first datetime
    When I check "Is this a recurring event?"
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
        | Points value  | 3                               |

      When I check "Is this a recurring event?"
      When I select "December 4, 2018 05:00 PM" as the first datetime
      When I press "Add another occurrence"
      When I select "October 4, 2018 05:00 PM" as the second datetime
      When I press "Add another occurrence"
      When I select "November 4, 2018 05:00 PM" as the third datetime
      When I press "Add this New Event"
      Then I should be on the events page
      And I should see "New event 'Class 2' created"
      And I should see that "Class 2" has a location of "40 Broad St"
      And I should see that "Class 2" has a description of "Carbon Footprint Class"
      And I should see that "Class 2" has a date_time of "October 4, 2018 05:00 PM"
