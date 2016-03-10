Feature: Log In
	As a returning clinic patient
	So that the site can track my registration and reviews
	I want to log in

Background:
	Given the following users exist:
	| first name     |  last name     | email                | password  |
	| Daniel         |  Ahrens        | dahrens@berkeley.edu | password  |
	And I am on the home page
	When I follow "Log in"
	Then I should be on the Login page

Scenario: Log-in (normal)
	When I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should see "dahrens@berkeley.edu"

Scenario: Log-in (Bad username)
	When I fill in "Email" with "notdaniel@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should see the error message "No user found with that email"		

Scenario: Log-in (Bad password)
	When I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "incorrect"
	And I press "Submit"
	Then I should see the error message "Incorrect Password"	
