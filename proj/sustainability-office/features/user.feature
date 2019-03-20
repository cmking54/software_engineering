Feature:
    As a User
    So that I can join different events
    I want to be able to manage my profile

    Scenario: Sign in with Google
        Given I have a profile
        Given I am on the home page
        When I follow "Sign in with Google"
        And I have filled in all my information
        Then I should see my profile

    Scenario: Create a profile with Google
        Given I do not have a profile
        Given I am on the home page
        When I follow "Sign in with Google"

    Scenario: View my profile
        Given I am signed in with provider Google
        Given I am on the home page
        Then I should see my name
        When I click on my name
        Then I should see my profile
