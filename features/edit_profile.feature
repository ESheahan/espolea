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
	And I press "Log In"
	Then I should see "dahrens@berkeley.edu"
	And I should see "Edit"
	When I follow "Edit"
	Then I should be on the edit profile page
    And I should see "dahrens@berkeley.edu"
	
Scenario: adding valid information
		When I fill in "Email" with "ahrens.danielj@gmail.com"
        And I fill in "Current password" with "password"
		And I press "Update"
		Then I should be on the home page
		And I should see "ahrens.danielj@gmail.com"

Scenario: adding invalid information
		When I fill in "Email" with ""
        And I fill in "Password" with "password"
		And I press "Update"
		Then I should see the error message "Email can't be blank"

Scenario: Viewing all the users
        Given I am on the users listing page
        Then I should see "dahrens@berkeley.edu"

Scenario: Deleting a user
        When I press "Cancel my account"
        Given I am on the users listing page
        Then I should not see "dahrens@berkeley.edu"
