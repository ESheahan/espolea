Feature:
    As a user
    So I can fix errors in a review
    I want to be able to edit and delete reviews

Background:
      Given the following users exist:
  | first_name | last_name | email                | password |
  | Daniel     | Ahrens    | dahrens@berkeley.edu | password |
 
  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

     Given the following reviews exist:
  | title       | rating      | text         | user_id |clinic_id   |
  | Test Review | 5           | Nothing Here | 1       |1           |
    Given I login as "dahrens@berkeley.edu" with "password"
    Given I am on the reviews listing page
    Then I should see "Test Review"
 
Scenario: Updating a review
    When I follow "Edit"
    And I fill in "Title" with "Best Review"
    And I press "Update Review"
    Then I should see "Best Review"

Scenario: Deleting a review
    When I follow "Destroy"
    Then I should be on the reviews listing page
    And I should not see "Test Review"
