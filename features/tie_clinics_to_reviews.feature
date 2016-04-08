Feature:
  As a user
  So that I can make informed decisions about clinics
  I want to be able to see all reviews about a clinic

Background:
  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

  Given the following reviews exist:
  | title       | rating  | text         |
  | Test Review | 5       | Nothing Here |

  Given that “Test Review” is associated with “Clinic 1”

Scenario: View a Clinic and see its reviews
	Given I am on the Clinics Listing page
	And I follow “Clinic 1”
	Then I should see “Test Review”
