Feature: Create a Clinic
	As an administrator
	So that users can review and register for a clinic
	I want to be able to create, edit and delete clinics

Background:
	Given the following clinics exist:
	| name       | phone_number   | email             |
	| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
	| Clinic 2   | (234) 567-8901 | clinic2@gmail.com |

    Given the following users exist:
    | first name | last name | email                | password | admin |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | true  |

    Given I login as "dahrens@berkeley.edu" with "password" 
	And I am on the clinics listing page

Scenario: adding clinic to the list
	When I follow "New Clinic"
	Then I should be on the "Add Clinic" Page
	When I fill in "Name" with "New Clinic"
	And I fill in "Phone" with "(345) 678-9012"
	And I fill in "Email" with "newclinic@gmail.com"
	And I press "Create Clinic"
	Then I should be on the clinics listing page for "New Clinic"
	And I should see "New Clinic"

Scenario: editing an existing clinic
	When I follow "Clinic 1"
	And I follow "Edit"
	Then I should be on the edit clinics page for "Clinic 1"
	When I fill in "Name" with "Edited Clinic"
	And I press "Update Clinic"
	Then I should be on the clinics listing page for "Edited Clinic"
	And I should see "Edited Clinic"

Scenario: editing an existing clinic with bad information (sad path)
	When I follow "Clinic 1"
	And I follow "Edit"
	When I fill in "Name" with ""
    And I fill in "Phone number" with ""
    And I fill in "Email" with ""
    And I fill in "Website" with ""
	And I press "Update Clinic"
	Then I should be on the edit clinics page for "Clinic 1"
	And I should see the error message "Name field required for clinic"
	
Scenario: deleting an existing clinic
	When I follow "Clinic 1"
    And I follow "Edit"
	And I press "Delete Clinic"
	Then I should be on the confirm deletion page for "Clinic 1"
	And I should see "Are you sure you want to delete Clinic 1"
	And I press "Confirm Deletion"
	Then I should be on the clinics listing page
	And I should not see "Clinic 1"

Scenario: canceling a clinic deletion
	When I follow "Clinic 1"
    And I follow "Edit"
	And I press "Delete Clinic"
	Then I should be on the confirm deletion page for "Clinic 1"
	And I should see "Are you sure you want to delete Clinic 1"
	And I follow "Cancel"
	Then I should be on the edit clinics page for "Clinic 1"
	And I should see "Clinic 1"
