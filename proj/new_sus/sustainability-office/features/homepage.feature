Feature: Visit a clean homepage
  Given I am a user of the sustainability passport
  so that I can easily navigate the website
  I want to visit a homepage with general information and links to specific areas of the site

Scenario: visiting the homepage
    Given I am on the home page
    Then I should see some general information about the passport
    And I should see links to other areas of the site
