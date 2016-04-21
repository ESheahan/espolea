Feature:
	As a user
	So I can evaluate clinic quality more quickly
	I want to see clinic overview information

Background:
	Given the following users exist:
    | first name | last name | email                | password | 
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 

    Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

    Given the following reviews exist:
    | title         | rating | body   | helpfulness | clinic_id | user_id |
    | Test Review   | 5      | great! | 4           | 1         | 1       |
    | Test Review 2 | 5      | lame   | 1           | 1         | 1       |


Scenario: On the clinics listing page, should see overview info
	Given I am on the clinics listing page
	Then I should see "Average Rating"
	And I should see "5"
	And I should see "Reviews"
	And I should see "2"
	And I should see "Check-Ins"

Scenario: On the individual clinics page, should see overview info
	Given I am on the clinics listing page
	And I follow "Clinic 1"
	Then I should see "Average Rating"
	And I should see "5"
	And I should see "Reviews"
	And I should see "2"
	And I should see "Check-Ins"
