Feature: Create a new rental property
  As home owner
  so that I can rent my house to earn some money
  I want to be able to add a new rental property.

  Background: the website already has some existing properties for rent
    Given these RentalProperties:
      | title     | description              | price  | bedrooms | beds | maxpersons | bathrooms | pets_allowed | address      |
      | bungalow  | cozy and sunny           | 175.00 |  3       | 3    | 4          | 2         | no           | Hamilton, NY   |
      | beach hut | hammocks + ocean breezes | 202.00 |  0       | 2    | 2          | 1         | yes          | Bar Harbor, ME |

  Scenario: Create a new rental property without specific image
    Given I am on the create new rental property page
    When I fill in the following:
      | Title                     | treehouse                 |
      | Description               | not too high up           |
      | Price                     | 14.50                     |
      | Number of bedrooms        | 1                         |
      | Total number of beds      | 1                         |
      | Maximum occupancy         | 1                         |
      | Total number of bathrooms | 0                         |
      | Address                   | 13 Oak Drive, Hamilton NY |

    When I check "Are pets allowed?"
    When I press "Create rental property listing"
    Then I should be on the rental properties page
    And I should see "New rental property 'treehouse' created"
    And I should see that "treehouse" has a price of "$14.50"
    And I should see that "treehouse" has an image "noimg"

  Scenario: Create a new rental property with a specific image
    Given I am on the create new rental property page
    When I fill in the following:
      | Title                     | treehouse                 |
      | Description               | not too high up           |
      | Price                     | 14.50                     |
      | Number of bedrooms        | 1                         |
      | Total number of beds      | 1                         |
      | Maximum occupancy         | 1                         |
      | Total number of bathrooms | 0                         |
      | Address                   | 13 Oak Drive, Hamilton NY |

    When I check "Are pets allowed?"
    When I attach the file "treehouse.jpg" to "Image"
    And I press "Create rental property listing"
    Then I should be on the rental properties page
    And I should see "New rental property 'treehouse' created"
    And I should see that "treehouse" has a price of "$14.50"
    And I should see that "treehouse" has an image "treehouse"
