Feature: Create a Clinic
	As an administrator
	So that users can review and register for a clinic
	I want to be able to create, edit and delete clinics

Background:
	Given the following clinics exist:
	| name       | phone          | email             |
	| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
	| Clinic 2   | (234) 567-8901 | clinic2@gmail.com |

	Given that I am an administrator
	And I am on the clinics listing page

Scenario: adding clinic to the list
	When I follow "Add Clinic"
	Then I should be on the "Add Clinic" Page
	When I fill in "Name" with "New Clinic"
	And I fill in "Phone" with "(345) 678-9012"
	And I fill in "Email" with "newclinic@gmail.com"
	And I press "Add Clinic"
	Then I should be on the clinics listing page
	And I should see "New Clinic"

Scenario: editing an existing clinic
	When I follow "Clinic 1"
	And I follow "Edit Clinic"
	Then I should be on an edit clinics page
	When I fill in "Name" with "Edited Clinic"
	And I press "Confirm Changes"
	Then I should be on the clinics listing page
	And I should see "Edited Clinic"

Scenario: editing an existing clinic with bad information (sad path)
	When I follow "Clinic 1"
	And I follow "Edit Clinic"
	When I fill in "Name" with ""
	And I press "Confirm Changes"
	Then I should be on an edit clinics page
	And I should see the error message "Name field required for clinic"
	
Scenario: deleting an existing clinic
	When I follow "Clinic 1"
	And I follow "Delete Clinic"
	Then I should be on a confirm deletion page
	And I should see "Do you really want to delete ‘Clinic 1’"
	And I press "Confirm Deletion"
	Then I should be on the clinics listing page
	And I should not see "Clinic 1"

Scenario: canceling a clinic deletion
	When I follow "Clinic 1"
	And I follow "Delete Clinic"
	Then I should be on a confirm deletion page
	And I should see "Do you really want to delete ‘Clinic 1’"
	And I press "Cancel"
	Then I should be on the clinics listing page
	And I should see "Clinic 1"
