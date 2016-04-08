Get Clinic Listing Working

As a user
So I know what clinics are nearby
I want to see all the clinics on the clinic page

Given the following clinics exist:
| name       | phone_number   | email             |
| Clinic 1   | (123) 456-7890 | clinic1@gmail.com |
| Clinic 2   | (123) 456-7891 | clinic2@gmail.com |
| Clinic 3   | (123) 456-7892 | clinic3@gmail.com |

Given that I am on the clinics listing page

Scenario: See all the clinics on the clinics listing page
	Then I should see “Clinic 1”
	And I should see “Clinic 2”
	And I should see “Clinic 3”