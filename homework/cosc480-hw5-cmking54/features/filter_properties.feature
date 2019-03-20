Feature: Filter and sort rental properties
  As a potential renter
  so that I can find homes that meet my needs
  I want to be able to sort and filter rental properties

  Background: the website already has some existing properties for rent
    Given these RentalProperties:
      | title     | description              | price  | bedrooms | beds | maxpersons | bathrooms | pets_allowed | address      |
      | bungalow  | cozy and sunny           | 175.00 |  3       | 3    | 4          | 2         | no           | Hamilton, NY   |
      | beach hut | hammocks + ocean breezes | 202.00 |  0       | 2    | 2          | 1         | yes          | Bar Harbor, ME |

  Scenario: filter by maximum price
    When I go to the rental properties page
    And I fill in "Maximum price" with "200"
    And I press "Refine the list of rental properties"
    Then I should be on the rental properties page
    And I should see "bungalow"
    But I should not see "beach hut"

  Scenario: sort by title
    When I go to the rental properties page
    And I follow "Property"
    Then I should be on the rental properties page
    Then I should see property title in sorted order
