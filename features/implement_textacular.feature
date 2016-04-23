Feature:
  As a user
  So that I can search for locations without knowing exact information
  I want to be able to fuzzy search with textacular

Background:
  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

  Given I am on the clinics listing page

Scenario: Search that matches
	And I fill in "filterrific[search_query]" with "Clinic 1"
	Then I should see "Clinic 1"
	And I should see "clinic1@gmail.com"

Scenario: Search with a partial match
	And I fill in "filterrific[search_query]" with "Clin" 
	Then I should see "Clinic 1"
	And I should see "clinic1@gmail.com"

Scenario: Fuzzy match
	And I fill in "filterrific[search_query]" with "CLN 1"
	Then I should see "Clinic 1"
	And I should see "clinic1@gmail.com"
