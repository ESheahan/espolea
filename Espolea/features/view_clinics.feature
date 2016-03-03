Feature: View list of all Clinics
	As any user
	So that I know what clinics I can visit
	I want to see a list of all the clinics
	
Background:
	Given the following clinics exist:
	| name       | phone          | email             |
	| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
	| Clinic 2   | (234) 567-8901 | clinic2@gmail.com |

Scenario: navigate from home page to clinics index
	Given that I am on the home page
	When I follow “Clinics”
	Then I should be on the clinics listing page
	And I should see “Clinic 1”
	And I should see “Clinic 2”
	And I should not see “Clinic 3”
