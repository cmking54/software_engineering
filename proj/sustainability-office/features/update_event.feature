Feature: Edit an event
    As an admin
    so that I can keep the details of an event up to date
    I want to be able to update event information.

    Background: the website already has some existing events, users and registrees
      Given these Events:
          | id  | title           |  location        | recurring | points | description                     |
          | 1   | Class 1         |  Persson 108     | yes       | 3      | Recycling Class                 |
          | 2   | Non-recurring 1 |  Love Auditorium | no        | 1      |Guest Speaker on Global Warming |

      Given these users:
            | name         | classification |
            | John Cane    | Faculty        |
            | Thomas Smith | Student        |

      Given these Occurrences:
            | event_id |  date_time |
            | 2        | November 2, 2018 7:00 PM |
            | 1        | October 30, 2018 4:30 PM |
            | 1        | October 19, 2019 8:00 PM |

    Scenario: Update the details of a specific event
     Given I am signed in with provider Google
     Given I am an admin
     Given I am on the events page
     When I follow "Class 1"
     Then I should see "October 30, 2018 04:30 PM"
     And I should see "Persson 108"
     And I should see "Recycling Class"
     When I follow "Edit event details"
     And I fill in "Description" with "Learning about the third R: Recycling"
     And I fill in "Location" with "Ho 101"
     And I press "Update event details"
     Then I should see "Learning about the third R: Recycling"
     And I should see "Ho 101"

   Scenario: Incorrectly update the details of a specific event
    Given I am signed in with provider Google
    Given I am an admin
    Given I am on the events page
    When I follow "Class 1"
    Then I should see "October 30, 2018 04:30 PM"
    And I should see "Persson 108"
    And I should see "Recycling Class"
    When I follow "Edit event details"
    And I fill in "Description" with ""
    And I press "Update event details"
    Then I should see "Error updating event"

  Scenario: Delete an event
   Given I am signed in with provider Google
   Given I am an admin
   Given I am on the events page
   When I follow "Class 1"
   Then I should see "October 30, 2018 04:30 PM"
   When I follow "Delete event"
   Then I should be on the events page
   And I should see "Event Class 1 deleted"

  Scenario: Delete an occurrence of an event
    Given I am signed in with provider Google
    Given I am an admin
    Given I am on the events page
    When I follow "Class 1"
    When I follow "Edit event details"
    When I check "Delete"
    And I press "Delete checked occurrences"
    And I press "Update event details"
    Then I should see "Event Class 1 updated"
    When I follow "Class 1"
    Then I should not see "October 19, 2019 8:00 PM"

  Scenario: Add an occurrence to an event
    Given I am signed in with provider Google
    Given I am an admin
    Given I am on the events page
    When I follow "Class 1"
    When I follow "Edit event details"
    When I press "Add another occurrence"
    Then I select "October 21, 2020 8:00 PM" as the third datetime
    And I press "Update event details"
    Then I should see "Event Class 1 updated"
    When I follow "Class 1"
    Then I should see "October 21, 2020 08:00 PM"
    And I should see "October 30, 2018 04:30 PM"
    And I should see "October 19, 2019 08:00 PM"
