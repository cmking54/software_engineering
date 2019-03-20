Feature: Update existing rental property
  As a home owner
  so that I keep my listed property up to date
  I want to be able to update rental property information.

  Background: the website already has some existing properties for rent
    Given these RentalProperties:
      | title     | description              | price  | bedrooms | beds | maxpersons | bathrooms | pets_allowed | address      |
      | bungalow  | cozy and sunny           | 175.00 |  3       | 3    | 4          | 2         | no           | Hamilton, NY   |
      | beach hut | hammocks + ocean breezes | 202.00 |  0       | 2    | 2          | 1         | yes          | Bar Harbor, ME |

  Scenario: Update an existing rental property
    Given I am on the rental properties page
    When I follow "beach hut"
    Then I should see "hammocks + ocean breezes"
    And I should see "$202.00"
    And I should see the image "noimg"
    When I follow "Edit rental property details"
    And I fill in "Description" with "hammocks + ocean breezes on high season"
    And I fill in "Price" with "295.95"
    And I attach the file "hammock.jpg" to "Image"
    And I press "Update rental property details"
    Then I should see "hammocks + ocean breezes on high season"
    And I should see "$295.95"
    And I should see the image "hammock"
