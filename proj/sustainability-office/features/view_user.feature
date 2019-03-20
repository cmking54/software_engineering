Feature: View a user
  As an admin
  so that I can see basic info and what events a user has attended
  I want to be able to view a user's profile page

  Background: the website already has some existing events and users
    Given these Events:
       | id | title           |  location        | recurring | points | description                     |
       | 1  | Class 1         |  Persson 108     | yes       | 3      | Recycling Class                 |
       | 2  | Non-recurring 1 |  Love Auditorium | no        | 1      | Guest Speaker on Global Warming |

   Given these users:
       | name         | classification |
       | John Cane    | Faculty        |
       | Thomas Smith | Student        |

  Given these Occurrences:
       | event_id | date_time                |
       | 1        | October 30, 2018 4:30 PM |
       | 2        | November 2, 2018 7:00 PM |

  Given these registrees:
       | user_id | event_id |
       |   1     | 2        |
       |   1     | 1        |

  Scenario: View details of an event's registree
    Given I am signed in with provider Google
    And I am an admin
    Given I am on the events page
    When I follow "Class 1"
    When I follow "View Registrees"
    When I follow "John Cane"
    Then I should see "Email Address:"
    And I should see "Events Registered For:"
    And I should see "Class 1"
    And I should see "Non-recurring 1"

Scenario: View all Users
    Given I am signed in with provider Google
    And I am an admin
    Given I am on the events page
    When I follow "View All Users"
    Then I should see "All Users:"
    And I should see "John Cane"
