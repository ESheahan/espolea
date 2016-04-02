Feature:
	As a user
	So I only have to log in once
	A session should be created when I log in

Background:
	Given the following users exist:
	| first_name | last_name | email                | password |
	| Daniel     | Ahrens    | dahrens@berkeley.edu | password |
	Given I login as "dahrens@berkeley.edu" with "password"
	And I should see "Welcome, dahrens@berkeley.edu"

Scenario: Follow another page link, should still see profile information
	When I follow "Clinics"
	Then I should be on the clinics listing page
	And I should see "Welcome, dahrens@berkeley.edu"
	
Scenario: Can still go back to your profile page
	When I follow "Clinics"
	And I follow "Welcome, dahrens@berkeley.edu"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "dahrens@berkeley.edu"
	
Scenario: When I log out, I should no longer see my username
  	When I follow "Welcome, dahrens@berkeley.edu"
  	And I press "Log Out"
  	Then I should be on the home page
  	And I should not see "Welcome, dahrens@berkeley.edu"
