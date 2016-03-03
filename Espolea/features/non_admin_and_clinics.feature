Feature: Non-admin users not able to add/edit/delete clinics
	Background:
	Given the following clinics exist:
	| name       | phone          | email             |
	| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
	| Clinic 2   | (234) 567-8901 | clinic2@gmail.com |

	Given that I am not an administrator
	And I am on the clinics listing page

Scenario: Should not have add option
	Then I should not see “Add Clinic”

Scenario: Should not have edit or delete option
	When I follow “Clinic 1”
	Then I should not see “Edit Clinic”
	And I should not see “Delete Clinic”