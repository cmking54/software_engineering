Feature: View leaderboard
  As a user
  So I can see the top participants
  I want to view a leaderboard of top participants

    Background: the website already has some existing events and users

      Given these users:
          | first_name         | last_name   | role           | points |
          | John               | Cane        | Faculty        |8       |
          | Thomas             |Smith        | Student        |2       |


    Scenario: View leaderboard
      Given I am on the events page
      When I follow "Leaderboard"
      Then I should be on the leaderboard page
      And I should see "John Cane"
      And I should not see "Thomas Smith"
