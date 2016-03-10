Feature: Create a Profile
	As a first-time clinic patient
	So that I can have a user profile on Espolea
	I want to create a profile

Background:
    Given I am on the home page
    When I follow "Log in"
    And I follow "Register here!"
	Then I should be on the Create Profile page
    And I should see "Register to become a member of Espolea today!"

Scenario: Create a profile (Happy path)
	When I fill in "First name" with "Daniel"
	And I fill in "Last name" with "Ahrens"
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Create User"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "dahrens@berkeley.edu"
	
Scenario: Create a profile (Sad path)
	When I press "Create User"
	Then I should see the error message "Bad submission"
