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
	Then I should see "Suggest New Clinic"
	When I follow "Suggest New Clinic"
	And I fill out "Name" with "Suggested Clinic"
	And I fill out "Phone Number" with "(123) 456-7890"
	And I fill out "Municipality" with "Saltillo"
	And I fill out "State" with "Coahuila"
	And I press "Suggest Clinic"
	Then I should be on the Clinics Listing Page
	And I should see "Suggested Clinic (Pending)"

Scenario: Suggesting clinic without proper info
	Given I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
	Then I should see "Suggest New Clinic"
	When I follow "Suggest New Clinic"
	And I press "Suggest Clinic"
	Then I should be on the Suggest Clinic Page
	And I should see "Error"

Scenario: Suggesting a clinic without logging in
	Given I follow "Clinics"
	And I follow "Suggest New Clinic"
	Then I should see "Login to suggest clinic!"
	And I should not be on the Suggest Clinic Page