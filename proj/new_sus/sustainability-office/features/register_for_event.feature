Feature: Registering for an Event
    As a user of the website
    so that I can gain points for attending events in the passport program
    I want to be able to click on an event and register for that event

     Background: the website already has some existing events and users
       Given these Events:
         | id | title           |  location        | points | description                     |
         | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
         | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

       Given these users:
           | first_name         | last_name   | role           |
           | John               | Cane        | Faculty        |
           | Thomas             |Smith        | Student        |

        Scenario: Registering for an event
            Given I am signed in with provider Google
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "Register for this Event"
            And I press "Register"
            Then I should see "Successfully registered"
            And I should see "Non-recurring 1"
            And I should see "Love Auditorium"
            And I should see "Guest Speaker on Global Warming"

        Scenario: Already registered for an event
            Given I am signed in with provider Google
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "Register for this Event"
            And I press "Register"
            Then I should see "You are already registered for this event"
