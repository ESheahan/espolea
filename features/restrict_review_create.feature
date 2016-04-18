Feature:
  As a clinic
  So I can follow up with poor reviews
  I want reviews to be tied to users

Background:
  Given the following users exist:
  | first_name | last_name | email                | password | 
  | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 
  | Daniel     | Ahrens    | notdahrens@berkeley.edu | notpassword |

  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

  Given the following reviews exist:
  | title       | rating      | body         | user_id |clinic_id   |
  | Test Review | 5           | Nothing Here | 1       |1           |


Scenario: User is not logged in
	Given I am not logged in
        And I am on the home page
	And I follow "Clinics"
        And I follow "Clinic 1"
        And I follow "Add Review"
	Then I should be on the Login page

Scenario: User is logged in
	Given I login as "dahrens@berkeley.edu" with "password"
        And I am on the home page
	And I follow "Clinics"
        And I follow "Clinic 1"
        And I follow "Add Review"
	Then I should see "Title"

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
