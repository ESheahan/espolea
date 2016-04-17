Feature:
  As a user
  So I can find high quality helpful reviews
  I want to see more helpful reviews first
Background:
    Given the following users exist:
    | first name | last name | email                | password | 
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 
    Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

  Given the following reviews exist:
  | title         | rating | body   | helpfulness | clinic_id | user_id |
  | Test Review   | 5      | great! | 0           | 1         | 1       |
  | Test Review 2 | 5      | lame   | 0           | 1         | 1       |
    And I am on the home page
Scenario: Reviews should reflect helpfulness
	When I follow "Clinics"
	Given I fill in "filterrific_search_query" with "Clinic 1"
        Then I should see "Clinic 1"
        When I follow "Show"
	Then I should see "Helpfulness"
	And I should see "Test Review"
	And I should see "Test Review 2"
	And I should see "5"
	And I should see "great!"
	And I should see "4"

Scenario: Reviews should be voted on
	When I follow "Clinics"
	And I search "Clinic 1"
	Then I should see "Helpfulness"
	And I should see "Test Review"
	And I should see "Helpful?"
	When I press "Yes"
	Then I should see "5"

Scenario: Reviews should be sorted
	When I follow "Clinics" 
	Given I fill in "filterrific_search_query" with "Clinic 1"
        Then I should see "Clinic 1"
        When I follow "Show"
	Then I should see "Helpfulness"
	And I should see "Test Review" before "Test Review 2"
	And I should see "5"
	And I should see "great!"
	And I should see "4"
