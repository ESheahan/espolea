Feature:
  As a clinic
  So I can follow up with poor reviews
  I want reviews to be tied to users

Background:
  Given the following users exist:
  | first_name | last_name | email                | password | 
  | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 
  | Daniel     | Ahrens    | notdahrens@berkeley.edu | notpassword |

  Given the following reviews where created by users:
  | title       | rating      | text         | email |
  | Test Review | 5           | Nothing Here | dahrens@berkeley.edu |


Scenario: User is not logged in
	Given I am not logged in
	And I follow "Reviews"
	Then I should not see "New Review"

Scenario: User is logged in
	Given I am logged in
	And I follow "Reviews"
	Then I should see "New Review"

Scenario: User has same reviews after logging out
	Given I login as "dahrens@berkeley.edu" with "password"
	Then I should be on the profile page for "dahrens@berkeley.edu"
	And I should see "Welcome, Daniel"
	Given I follow "Reviews"
	Then I should see "Test Review"

Scenario: Other user's reviews are not listed as my reviews
	Given I login as "notdahrens@berkeley.edu" with "notpassword"
	Then I should be on the profile page for "notdahrens@berkeley.edu"
	And I should see "Welcome, Daniel"
	Given I follow "Reviews"
	Then I should not see "Test Review"
