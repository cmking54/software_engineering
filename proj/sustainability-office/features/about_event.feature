Feature: View "About" Page
    As a user
    So that I can learn more about the passport program
    I want to be able to click on an "About" page which contains a description of the program

    Scenario: View the About Page
    Given I am on the events page
    When I follow "About the Program"
    Then I should be on the about page
    And I should see "About the Program"
