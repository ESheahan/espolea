Feature:
  As a user
  So I can see quickly what the other user's are talking about
  I want to see the most recent reviews just as I enter

Background:
  Given the following users exist:
  | first_name | last_name | email                | password | 
  | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 

  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |
  | Clinic 2   | (123) 456-7890 | clinic2@gmail.com | Monterrey    | Nuevo Leon |
  | Clinic 3   | (123) 456-7890 | clinic3@gmail.com | Monterrey    | Nuevo Leon |

  Given the following reviews exist:
  | title       | rating      | body         | user_id |clinic_id   |created_at             |
  | Test Review | 5           | Nothing Here | 1       |1           |2016-04-21 14:44:24    |
  | Other Review| 3           | Other content| 2       |2           |2016-04-20 14:44:24    |
  | My Review   | 1           | Something    | 1       |2           |2016-03-10 14:44:24    |
  | This Review | 2           | Anything Here| 2       |1           |2016-02-10 14:44:24    |
  | Test2 Review| 4           | Nothing      | 2       |3           |2016-01-09 14:44:24    |

Scenario: User is not logged in
	Given I am not logged in
        And I am on the home page
	Then I should see "Recent Review"
        And I should see "Clinic 1" before "Clinic 2"
        And I should see "Nothing Here" before "Other content"
        And I should not see "Clinic 3"

Scenario: User is logged in
	Given I login as "dahrens@berkeley.edu" with "password"
        And I am on the home page
	Then I should see "Recent Review"
        And I should see "Clinic 1" before "Clinic 2"
        And I should see "Nothing Here" before "Other content"
        And I should not see "Clinic 3"


