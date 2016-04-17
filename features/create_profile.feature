Feature: Create a Profile
	As a first-time clinic patient
	So that I can have a user profile on Espolea
	I want to create a profile

Background:
    Given I am on the home page
    When I follow "Log in"
    And I follow "Sign up"
	Then I should be on the Create Profile page
    And I should see "Register to become a member of Espolea today!"

Scenario: Create a profile (Happy path)
	When I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
	And I press "Sign up"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "dahrens@berkeley.edu"
	
Scenario: Create a profile (Sad path)
	When I press "Sign up"
	When I fill in "Email" with ""
	And I fill in "Password" with ""
    And I fill in "Password confirmation" with ""
    Then I should see the error message "Email can't be blank"
    And I should see the error message "Password can't be blank"

Scenario: Viewing all the users
    Given I am on the users listing page
    Then I should see "Listing Users"

Scenario:
    Given I am on profile page "1"
    Then I should see "I'm looking for a clinic in"
