Feature: Edit a profile
	As a returning clinic patient
	So that I can keep up to date accurate medical and treatment information
	I want to edit my profile details

Background:
	Given the following users exist:
	| first name     |  last name     | email                | password  |
	| Daniel         |  Ahrens        | dahrens@berkeley.edu | password  |

	Given I am on the Login page
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should see "Daniel Ahrens"
	And I should see "Edit Profile"
	When I follow "Edit Profile"
	Then I should be on my edit profile page
	
Scenario: adding valid information
		When I fill in "Email" with "ahrens.danielj@gmail.com"
		And I press "Confirm Changes"
		Then I should be on my profile page
		And I should see "ahrens.danielj@gmail.com"

Scenario: adding invalid information
		When I fill in "Email" with ""
		And I press "Confirm Changes"
		Then I should be on my edit profile page
		And I should see the error message "Invalid Email"
