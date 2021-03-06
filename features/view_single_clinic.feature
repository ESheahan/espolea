Feature: View a Particular Clinic
	As any user
	So that I can submit reviews and register for a clinic
	I want to view the details of a particular clinic

Background:
	Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |
    | Clinic 2   | (123) 456-7891 | clinic2@gmail.com | Monterrey    | Nuevo Leon |
    
Scenario: navigate from clinics listing to a clinics detail page
	Given I am on the clinics listing page
	When I follow "Clinic 1"
	Then I should see "Clinic 1"
	And I should see "(123) 456-7890"
	And I should see "clinic1@gmail.com"
