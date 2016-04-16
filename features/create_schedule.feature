Feature:
    As a clinic
    So that I can provide treatment to my patients
    I want to be able to create a schedule
    
Background:
  
    Given the following clinics exist:
    | name        | phone_number   | email             | municipality | state      |
    | Test Clinic | (123) 456-7890 | clinic1@gmail.com | Saltillo     | Coahuila   |
      
    Given the following users exist:
    | first_name | last_name | email                | password |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password |
    | Not        | Daniel    | notdaniel@gmail.com  | password |
    
    Given "dahrens@berkeley.edu" manages "Test Clinic"
    #TODO: How do you make sure that there isn't a clinic related to "Not Daniel"?
    Given I login as "dahrens@berkeley.edu" with "password"
    Then I should be on the profile page for "dahrens@berkeley.edu"
    And I should see "Manage Test Clinic"
    When I follow "Manage Test Clinic"
    And I follow "Add Scheduling Block"
    Then I should see "Treatment options"
    And I fill in "Treatment options" with "methadone; clean_needles"
    And I select "2016" from "schedule_start_time_1i"
    And I select "April" from "schedule_start_time_2i"
    And I select "1" from "schedule_start_time_3i"

Scenario: Logging in and adding schedule, then editing
    And I select "2016" from "schedule_end_time_1i"
    And I select "April" from "schedule_end_time_2i"
    And I select "1" from "schedule_end_time_3i"
    And I press "Create Schedule"
    Then I should see "2016-04-01"
    When I follow "Edit"
    And I select "2" from "schedule_end_time_3i"
    And I press "Update Schedule"
    Then I should see "2016-04-02"
    When I press "Delete"
    Then I should see "Listing Schedules"

    
Scenario: Adding an invalid start time
    And I select "2015" from "schedule_end_time_1i"
    And I select "April" from "schedule_end_time_2i"
    And I select "1" from "schedule_end_time_3i"
    And I press "Create Schedule"
    Then I should be on the appointment scheduling page
    
Scenario: Trying to edit as an incorrect users
    Then I follow "Welcome, dahrens@berkeley.edu"
    And I press "Log Out"
    And I login as "notdaniel@gmail.com" with "password"
    Then I should be on the profile page for "notdaniel@gmail.com"
    And I should not see "Manage Clinic"


