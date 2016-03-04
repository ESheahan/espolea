Feature: Create a Profile
	As a first-time clinic patient
	So that I can have a user profile on Espolea
	I want to create a profile

Scenario: Create a profile (Happy path)
	Given I am on the home page
	When I press “Create User Profile”
	Then I should be on the Create Profile page
	When I fill in “First Name” with “Daniel”
	And I fill in “Last Name” with “Ahrens”
	And I fill in “Email” with “dahrens@berkeley.edu”
	And I fill in “Password” with “password”
	And I press “Create Profile”
	Then I should be on my profile page
	And I should see “Daniel Ahrens”
	
Scenario: Create a profile (Sad path)
	Given I am on the home page
	When I press “Create User Profile”
	Then I should be on the Create Profile page
	And I press “Create Profile”
	Then I should see the error “Bad submission”
