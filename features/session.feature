Feature:
	As a user
	So I only have to log in once
	A session should be created when I log in

Background:
	Give the following users exist:
	| first_name | last_name | email                | password |
	| Daniel     | Ahrens    | dahrens@berkeley.edu | password |
	Given I login as "dahrens@berkeley.edu" with "password"
	Then I should be on the profile page for "dahres@berkeley.edu"
	And I should see "Welcome, Daniel"

Scenario: Follow another page link, should still see profile information
	When I follow "Clinics"
	Then I should be on the clinics listing page
	And I should see "Welcome, Daniel"
	And I should see "Profile"
	
Scenario: Can still go back to your profile page
	When I follow "Clinics"
	And I follow "Profile"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "Daniel Ahrens"
	
Scenario: When I log out, I should no longer see my username
  	When I follow "Profile"
  	And I follow "Log Out"
  	Then I should be on the login page
  	And I should not see "Daniel Ahrens"
