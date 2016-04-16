Feature: Search for a Clinic
	As an user
	So that I can find the right clinic for me
	I want to be able to search through clinics

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

Scenario: searching for a clinic
    Then I should see "Search"
	When I fill in "filterrific[search_query]" with "Clinic1"
    And I select "Saltillo" from "filterrific[by_municipality]"
    And I select "Coahuila" from "filterrific[by_state]"
    And I press "#search_button"
