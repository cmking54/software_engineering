Feature: View an event
    As an admin
    so that I can see the details and check the registration/attendance of an event
    I want to be able to view the details and attendance of each event and class.

    Background: the website already has some existing events and users
       Given these Events:
         | id | title           |  location        | points | description                     |
         | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
         | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

       Given these users:
           | first_name         | last_name   | role           |
           | John               | Cane        | Faculty        |
           | Thomas             |Smith        | Student        |



    Scenario: View details of a specific event
     Given I am on the events page
     When I follow "Class 1"

     And I should see "Persson 108"
     And I should see "Recycling Class"
     And I should see the image "noimg"

    Scenario: View Registrees of a specific event
     Given I am signed in with provider Google
     Given I am on the events page
     When I follow "Non-recurring 1"

     And I should see "Love Auditorium"
     And I should see "Guest Speaker on Global Warming"

    Scenario: Event has no registrees
    Given I am signed in with provider Google
    Given I am on the events page
    When I follow "Class 1"
    When I follow "See Who is Registered"
    Then I should see "Nobody has registered for Class 1 yet."
