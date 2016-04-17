Feature:
    As a user
    So that I can provide information about clinics to other users 
    I want to be able to write a review
Background:
  Given the following users exist:
  | first_name | last_name | email                | password | 
  | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 
  Given I login as "dahrens@berkeley.edu" with "password"
  Then I should be on the profile page for "dahrens@berkeley.edu"
  And I should see "Welcome, Daniel"
  Given I follow "Reviews" 
  And I follow "Write Review"

Scenario: Create a new review
    When I fill in "Title" with "Test Review"
    And I fill in "Body" with "Test Text"
    And I fill in "Rating" with "3"
    And I press "Create Review"
    Then I should see "Test Review"
    Then I should see "Test Text"

Scenario: Invalid review
    When I fill in "Title" with ""
    And I fill in "Body" with ""
    And I fill in "Rating" with ""
    And I press "Create Review"
    Then I should not see "Test Review"



