Feature:
	Given that I am a non-admin user
	So that I can't mess with other users
	I shouldn't be able to alter or delete clinics

Background:
	Given the following clinics exist:
	| name       | phone          | email             |
	| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
	| Clinic 2   | (234) 567-8901 | clinic2@gmail.com |

    Given the following users exist:
    | first name | last name | email                | password | admin |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | false |

    Given I login as "dahrens@berkeley.edu" with "password"
	And I am on the clinics listing page

Scenario: Should not have add option
	Then I should not see "Add Clinic"

Scenario: Should not have edit or delete option
	When I follow "Clinic 1"
	Then I should not see "Edit Clinic"
	And I should not see "Delete Clinic"
