Feature:
  As a user
  So I can find high quality helpful reviews
  I want to see more helpful reviews first
Background:
  Given the following reviews exist:
  | title         | rating | text   | Email                 | Helpfulness | Clinic  |
  | Test Review   | 5      | great! | dahrens@berkeley.edu  | 4           | Clinic1 |
  | Test Review 2 | 5      | lame   | dahrens2@berkeley.edu | 1           | Clinic1 |

Scenario: Reviews should reflect helpfulness
	When I follow Clinics
	And I search “Clinic 1”
	Then I should see “Helpfulness”
	And I should see “Test Review”
	And I should see “Test Review 2”
	And I should see “5”
	And I should see “great!”
	And I should see “4”

Scenario: Reviews should be voted on
	When I follow Clinics
	And I search “Clinic 1”
	Then I should see “Helpfulness”
	And I should see “Test Review”
	And I should see “Helpful?”
	When I press “Yes”
	Then I should see “5”

Scenario: Reviews should be sorted
	When I follow Clinics
	And I search “Clinic 1”
	Then I should see “Helpfulness”
	And I should see “Test Review” before “Test Review 2”
	And I should see “5”
	And I should see “great!”
	And I should see “4”
