Feature: Log In
	As a returning clinic patient
	So that the site can track my registration and reviews
	I want to log in

Scenario: Log-in
	Given I am on the home page
	When I follow "Log in"
	Then I should be on the Login page
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should be on my profile page
	And I should see "Daniel Ahrens"

Scenario: Log-in (Bad username)
	Given I am on the home page
	When I follow "Log in"
	Then I should be on the Login page
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "password"
	And I press "Submit"
	Then I should see the error message "No user found with that email"		

Scenario: Log-in (Bad password)
	Given I am on the home page
	When I follow "Log in"
	Then I should be on the Login page
	And I fill in "Email" with "dahrens@berkeley.edu"
	And I fill in "Password" with "incorrect"
	And I press "Submit"
	Then I should see the error message "Incorrect Password"	
