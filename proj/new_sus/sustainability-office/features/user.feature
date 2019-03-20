Feature:
    As a User
    So that I can join different events
    I want to be able to manage my profile

    Scenario: View my profile
        Given I am signed in with provider Google
        Given I am on the home page
        Then I should see my name
        When I click on my name
        Then I should see my profile
