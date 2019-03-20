Feature: View a user
  As an admin
  so that I can see basic info and what events a user has attended
  I want to be able to view a user's profile page

  Background: the website already has some existing events and users
    Given these Events:
       | id | title           |  location        | points | description                     |
       | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
       | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

   Given these users:
       | first_name         | last_name   | role           |
       | John               | Cane        | Faculty        |
       | Thomas             |Smith        | Student        |

  Scenario: View details of an event's registree
    Given I am signed in with provider Google
    And I am an admin
    Given I am on the events page


Scenario: View all Users
    Given I am signed in with provider Google
    And I am an admin
    Given I am on the events page
    When I follow "People"
    Then I should see "All Users"
    And I should see "John Cane"
