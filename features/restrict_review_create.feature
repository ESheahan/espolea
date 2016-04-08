As a clinic
So I can follow up with poor reviews
I want reviews to be tied to users

Given the following users exist:
| first_name | last_name | email                | password | UID
| Daniel     | Ahrens    | dahrens@berkeley.edu | password | 5
| Daniel     | Ahrens    | notdahrens@berkeley.edu | notpassword | 6

 Given the following reviews exist:
| title       | rating      | text         | Email
| Test Review | 5           | Nothing Here | dahrens@berkeley.edu


Scenario: User is not logged in
	Given I am not logged in
	And I follow “Reviews”
	Then I should not see “New Review”

Scenario: User is logged in
	Given I am logged in
	And I follow “Reviews”
	Then I should see “New Review”

Scenario: User has same reviews after logging out
	Given I login as "dahrens@berkeley.edu" with "password"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "Welcome, Daniel"
	Given I follow “Reviews”
	I should see “Test Review”

Scenario: Other user’s reviews are not listed as my reviews
	Given I login as "notdahrens@berkeley.edu" with "notpassword"
	Then I should be on the profile page for "notdahrens@berkeley.edu"
	And I should see "Welcome, Daniel"
	Given I follow “Reviews”
	I should not see “Test Review”
