Feature: View attendee
    As a user
    so that I can view my information and summary I submitted
    I want to be able to view myself as an attendee for events I attended


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

      Scenario: Submiting a Summary for an event
          Given I am signed in with provider Google
          Given I am on the events page
          When I follow "Class 1"
          Then I follow "Register for this Event"
          Then I should see "You are now registered for the event Class 1"
          When I click on my name
          Then I should see my profile
          When I follow "Submit Event Summary"
          Then I should see "Add an Event Summary for Class 1"
          When I fill in "Summary" with "whats up"
          And I press "Submit this summary"
          Then I should see my profile
          And I should see "Summary created for 'Class 1'"
          When I follow "View Event Summary"
          Then I should see "Summary for Event Class 1"
