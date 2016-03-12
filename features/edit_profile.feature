Feature: Edit a profile
	As a returning clinic patient
	So that I can keep up to date accurate medical and treatment information
	I want to edit my profile details

Background:
	Given the following users exist:
	| first_name     |  last_name     | email                     | password  |
	| Daniel         |  Ahrens        | dahrens@berkeley.edu      | password  |

	Given I am on the Login page
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should see "dahrens@berkeley.edu"
	And I should see "Edit"
	When I follow "Edit"
	Then I should be on the edit profile page for "dahrens@berkeley.edu"
	
Scenario: adding valid information
		When I fill in "Email" with "ahrens.danielj@gmail.com"
		And I press "Update User"
		Then I should be on the profile page for "ahrens.danielj@gmail.com"
		And I should see "ahrens.danielj@gmail.com"

Scenario: adding invalid information
        When I fill in "First name" with ""
        And I fill in "Last name" with ""
		And I fill in "Email" with ""
        And I fill in "Password" with ""
		And I press "Update User"
		Then I should be on the edit profile page for "dahrens@berkeley.edu"
		And I should see the error message "Email field required"

Scenario: Viewing all the users
        Given I am on the users listing page
        Then I should see "dahrens@berkeley.edu"

Scenario: Deleting a user
        Given I am on the users listing page
        When I follow "Destroy"
        Then I should not see "dahrens@berkeley.edu"
