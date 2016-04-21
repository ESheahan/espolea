Feature:
    As an admin user
    So I can update contact information
    I want to be able to edit clinics

Background:


  Given the following users exist:
  | first_name | last_name   | email                  | password | admin|
  | Ana        | Arellano    | a01089996@itesm.mx     | password |  true|
  | Ana        | Arellano    | b01089996@itesm.mx     | password | false|

  Given the following clinics exist:
  | name       | phone_number   | email             | municipality | state      |
  | Clinic 1   | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |

Scenario: Updating a clinic as an admin user
    Given I login as "a01089996@itesm.mx" with "password"
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should see "edit"
 
Scenario: Logged user but not admin, can't update
    Given I login as "b01089996@itesm.mx" with "password"
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should not see "edit"

Scenario: Not logged in, can't update
    Given I'm not logged
    Given I am on the clinics listing page
    When I follow "Clinic 1"
    And I should not see "edit"