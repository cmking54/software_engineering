Feature: View an event
    As an admin
    so that I can see the details and check the registration/attendance of an event
    I want to be able to view the details and attendance of each event and class.

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


    Scenario: View details of a specific event
     Given I am on the events page
     When I follow "Class 1"
     Then I should see "October 30, 2018 04:30 PM"
     And I should see "Persson 108"
     And I should see "Recycling Class"
     And I should see the image "noimg"

    Scenario: View Registrees of a specific event
     Given I am signed in with provider Google
     Given I am on the events page
     When I follow "Non-recurring 1"
     Then I should see "November 2, 2018 07:00 PM"
     And I should see "Love Auditorium"
     And I should see "Guest Speaker on Global Warming"
     When I follow "View Registrees"
     Then I should see "John Cane"
     And I should see "Faculty"

    Scenario: Event has no registrees
    Given I am signed in with provider Google
    Given I am on the events page
    When I follow "Class 1"
    When I follow "View Registrees"
    Then I should see "There are no users registered for Class 1"
