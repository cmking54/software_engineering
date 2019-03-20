Feature: Edit an event
    As an admin
    so that I can keep the details of an event up to date
    I want to be able to update event information.

    Background: the website already has some existing events, users and registrees
      Given these Events:
        | id | title           |  location        | points | description                     |
        | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
        | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

      Given these users:
          | first_name         | last_name   | role           |
          | John               | Cane        | Faculty        |
          | Thomas             |Smith        | Student        |



    Scenario: Update the details of a specific event
     Given I am signed in with provider Google
     Given I am an admin
     Given I am on the events page
     When I follow "Class 1"
     And I should see "Persson 108"
     When I follow "Edit this Event"
     And I fill in "Description" with "Learning about the third R: Recycling"
     And I fill in "Location" with "Ho 101"
     And I press "Update Event"
     Then I should see "Learning about the third R: Recycling"
     And I should see "Ho 101"

   Scenario: Incorrectly update the details of a specific event
    Given I am signed in with provider Google
    Given I am an admin
    Given I am on the events page
    When I follow "Class 1"
    And I should see "Persson 108"
    And I should see "Recycling Class"
    When I follow "Edit this Event"
    And I fill in "Description" with ""
    And I press "Update Event"
    Then I should see "Error updating event"

  Scenario: Delete an event
   Given I am signed in with provider Google
   Given I am an admin
   Given I am on the events page
   When I follow "Class 1"
   When I follow "Delete this Event"
   Then I should be on the events page
   And I should see "Event Class 1 deleted"
