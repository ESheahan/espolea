Feature:
    As a user
    So I can review clinics that may not be listed
    I want to be able to suggest a new clinic

Background:

	Given the following users exist:
    | first name | last name | email                | password | 
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password |

Scenario: Properly suggesting a clinic (happy path)
	Given I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
	Then I should see "New Clinic"
	When I follow "New Clinic"
	And I fill in "Name" with "Suggested Clinic"
	And I fill in "Phone number" with "(123) 456-7890"
	And I fill in "Municipality" with "Saltillo"
	And I fill in "State" with "Coahuila"
	And I press "Create Clinic"
	Then I should be on the clinics listing page
	And I should not see "Suggested Clinic (Pending)"

Scenario: Suggesting clinic without proper info
	Given I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
	Then I should see "New Clinic"
	When I follow "New Clinic"
	And I press "Create Clinic"
	Then I should see "errors"

Scenario: Trying to suggest a clinic without logging in
    Given I am on the home page
	And I follow "Clinics"
	Then I should not see "New Clinic"
