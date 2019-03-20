Feature: Edit summary
    Given I am an attendee
    so that I can edit a previously submitted summary of an event
    I want to be able to edit an event summary I had already submitted

    Background: the website already has some existing events and users
        Given these Events:
            |id|title|location|recurring|points|description|
            |1 |Class 1| Persson 108|yes|3|Recycling Class|

        Given these Occurrences:
            |id|event_id|date_time               |
            |1|1       |October 30, 2018 4:30 PM|

        Given these users:
           |id |name       | classification |
           |1 |John Cane  | Faculty        |
           |2 |Thomas Smith|Student        |

        Given these registrees:
            |user_id|event_id |
            |1      |1        |

        Given these attendees:
            |user_id|occurrence_id|summary|
            |1      |1            |whats good|


Scenario: Editing a Summary for an event
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
    When I follow "Edit Event Summary"
    Then I should see "Edit an Existing Summary for Class 1"
    And I fill in "Summary" with "nothing much"
    And I press "Edit this summary"
    Then I should see my profile
    And I should see "Summary successfully edited for 'Class 1'"

Scenario: Failure to edit a summary for an event
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
    When I follow "Edit Event Summary"
    Then I should see "Edit an Existing Summary for Class 1"
    And I fill in "Summary" with ""
    And I press "Edit this summary"
    Then I should see my profile
    And I should see "Failed to edit summary for 'Class 1'"
