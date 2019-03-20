Feature: Registering for an Event
    As a user of the website
    so that I can gain points for attending events in the passport program
    I want to be able to click on an event and register for that event

     Background: the website already has some existing events and users
            Given these Events:
                | id | title| location| recurring | points | description|
                | 1  | Class 1| Persson 108| yes | 3| Recycling Class|
                | 2  | Non-recurring 1 | Love Auditorium | no| 1 | Guest Speaker on Global Warming |

            Given these Occurrences:
                | event_id | date_time                |
                | 1        | October 30, 2018 4:30 PM |
                | 2        | November 2, 2018 7:00 PM |

            Given these users:
                | name          | classification |
                | John Cane     | Faculty|
                | Thomas Smith  | Student|

            Given these registrees:
                |user_id | event_id  |
                | 1      | 2         |

        Scenario: Registering for an event
            Given I am signed in with provider Google
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "Register for this Event"
            Then I should see "You are now registered for the event Non-recurring 1"
            And I should see "Non-recurring 1"
            And I should see "November 2, 2018 07:00 PM"
            And I should see "Love Auditorium"
            And I should see "Guest Speaker on Global Warming"

        Scenario: Already registered for an event
            Given I am signed in with provider Google
            Given I am on the events page
            When I follow "Non-recurring 1"
            When I follow "Register for this Event"
            When I follow "Register for this Event"
            Then I should see "You are already registered for this event"

       
