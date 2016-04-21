Feature:
    As a user
    So I can support a clinic without writing a review
    I want to be able to check in at a clinic

Background:

	Given the following users exist:
    | first name | last name | email                | password | 
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 

    Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

Scenario: Adding a check in properly
	Given I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
	And I follow "Clinic 1"
	Then I should see "Check-Ins"
	And I should see "0"
	When I press "Check In Here"
	Then I should see "When Did You Visit"
	And I fill in "Date" with "April 1, 2016"
	And I press "Check In"
	Then I should see "Check-Ins"
	And I should see "1"

Scenario: Can't add a check in if not logged in
	Given I follow "Clinics"
	And I follow "Clinic 1"
	Then I should see "Check-Ins"
	And I should see "0"
	And I should not see "Check In Here"