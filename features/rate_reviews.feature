Feature:
	As a user
	So I can help other users to decide what clinics to attend
	I want to be able to rate reviews by helpfulness

Background:
    Given the following users exist:
    | first name | last name | email                | password | 
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password | 

    Given the following clinics exist:
	| name       | phone_number   | email             | municipality | state      |
    | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

   Given the following reviews exist:
   | title         | rating | body   | helpfulness | clinic_id | user_id |
   | Test Review   | 5      | great! | 4           | 1         | 1       |

    And I am on the home page

Scenario: Adding helpful review
    When I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
    And I follow "Clinic 1"
	Then I should see "Did this review help you?"
    When I press "Yes"
    Then I should be on the clinics listing page for "Clinic 1"

Scenario: Adding unhelpful review
    When I login as "dahrens@berkeley.edu" with "password"
	And I follow "Clinics"
    And I follow "Clinic 1"
	Then I should see "Did this review help you?"
    When I press "No"
    Then I should be on the clinics listing page for "Clinic 1"