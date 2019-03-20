Feature: View attendee
    As a user
    so that I can view my information and summary I submitted
    I want to be able to view myself as an attendee for events I attended


    Background: the website already has some existing events and users
      Given these Events:
        | id | title           |  location        | points | description                     |
        | 1  | Class 1         |  Persson 108     | 3      | Recycling Class                 |
        | 2  | Non-recurring 1 |  Love Auditorium | 1      | Guest Speaker on Global Warming |

      Given these users:
          | first_name         | last_name   | role           |
          | John               | Cane        | Faculty        |
          | Thomas             |Smith        | Student        |


      Scenario: Submiting a Summary for an event
          Given I am signed in with provider Google
          Given I am on the events page
          When I follow "Class 1"
          Then I follow "Register for this Event"
          And I press "Register"
          Then I should see "Successfully registered"
          When I click on my name
          Then I should see my profile
          
