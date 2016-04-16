Feature:
  As a user
  So I know what clinics are nearby
  I want to see all the clinics on the clinic page

Background:
  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |
  | Clinic 2   | (123) 456-7891 | clinic2@gmail.com | Monterrey    | Nuevo Leon |
  | Clinic 3   | (123) 456-7892 | clinic3@gmail.com | Puebla       | Puebla     |

  Given I am on the clinics listing page

Scenario: See all the clinics on the clinics listing page
	Then I should see "Clinic 1"
	And I should see "Clinic 2"
	And I should see "Clinic 3"