Feature: Create a Clinic
	As an administrator
	So that users can review and register for a clinic
	I want to be able to create, edit and delete clinics

Background:
    Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |
    | Clinic 2   | (123) 456-7891 | clinic2@gmail.com | Monterrey    | Nuevo Leon |

    Given the following users exist:
    | first name | last name | email                | password | admin |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | true  |

    Given I login as "dahrens@berkeley.edu" with "password" 
	And I am on the clinics listing page

Scenario: adding clinic to the list
	When I follow "New Clinic"
	Then I should be on the "Add Clinic" Page
	When I fill in "Name" with "My New Clinic"
        And I fill in "State" with "some state"
        And I fill in "Municipality" with "any municipality"
	And I press "Create Clinic"
        Then it should create clinic with values "My New Clinic" , "some state" , "any municipality"
	And I should be on the clinics listing page


Scenario: editing an existing clinic
	When I follow "Clinic 1"
	And I follow "edit"
	Then I should be on the edit clinics page for "Clinic 1"
	When I fill in "Name" with "Edited Clinic"
	And I press "Update Clinic"
	Then I should be on the clinics listing page for "Edited Clinic"
	And I should see "Edited Clinic"

Scenario: editing an existing clinic with bad information (sad path)
	When I follow "Clinic 1"
	And I follow "edit"
	When I fill in "Name" with ""
    And I fill in "Municipality" with ""
    And I fill in "State" with ""
	And I press "Update Clinic"
	Then I should be on the re edit clinics page for "Clinic 1"
	And I should see the error message "Name field required for clinic"
	And I should see the error message "State field required for clinic"
        And I should see the error message "Municipality field required for clinic"
Scenario: deleting an existing clinic
	When I follow "Clinic 1"
    And I follow "edit"
	And I press "Delete Clinic"
	Then I should be on the confirm deletion page for "Clinic 1"
	And I should see "Are you sure you want to delete Clinic 1"
	And I press "Confirm Deletion"
	Then I should be on the clinics listing page
	And I should not see "Clinic 1"

Scenario: canceling a clinic deletion
	When I follow "Clinic 1"
    And I follow "edit"
	And I press "Delete Clinic"
	Then I should be on the confirm deletion page for "Clinic 1"
	And I should see "Are you sure you want to delete Clinic 1"
	And I follow "Cancel"
	Then I should be on the edit clinics page for "Clinic 1"
	And I should see "Clinic 1"
