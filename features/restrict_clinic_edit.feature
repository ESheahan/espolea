Feature:
    As an admin user
    So the clinic's contact information is updated
    I want to be able to edit clinics

Background:
      Given the following users exist:
  | first_name | last_name | email                | password | admin|
  | Ana    | Arellano    | a01089996@itesm.mx     | password |  true|
  | Ana    | Arellano    | b01089996@itesm.mx     | password | false|
  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |


Scenario: Updating a clinic as an admin user
    Given I login as "a01089996@itesm.mx" with "password"
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should see "edit"
    When I follow "edit"
    Then I should be on the edit clinics page for "Clinic 1"

Scenario: Cancel update of a clinic as an admin user
    Given I login as "a01089996@itesm.mx" with "password"
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should see "edit"
    When I follow "edit"
    Then I should be on the edit clinics page for "Clinic 1"
    When I fill in "State" with "other"
    And I follow "back"
    Then I should be on the show clinics page for "Clinic 1"
    And I should see "Coahuila"

Scenario: Logged user but not admin, can't update
    Given I login as "b01089996@itesm.mx" with "password"
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should not see "edit"

Scenario: Not logged in, can't update
    Given I am not logged in
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should not see "edit"
