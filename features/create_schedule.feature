Feature:
    As a clinic
    So that I can provide treatment to my patients
    I want to be able to create a schedule
    
Background:
  
    Given the following clinics exist:
    | name        | location    |
    | Test Clinic | Mexico City |
      
    Given the following users exist:
    | first_name | last_name | email                | clinic      | password |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | Test Clinic | password |
    | Not        | Daniel    | notdaniel@gmail.com  | None        | password |
    
    #TODO: How do you make sure that there isn't a clinic related to "Not Daniel"?
    Given I login as "dahrens@berkeley.edu" with "password"
    Then I should be on the profile page for "dahrens@berkeley.edu"
    And I should see "Manage Test Clinic"
    When I follow "Manage Test Clinic"
    And I fill in "Treatment Options" with "methadone; clean_needles"
    And I fill in "Date" with "2016-3-24"
    And I fill in "Start Time" with "11:00 a.m."
    
Scenario: Logging in and adding schedule
    And I fill in "End Time" with "1:00 p.m."
    And I press "Submit Scheduling Block"
    Then I should be on the schedules listing page
    And I should see "2016-3-24"
    And I should see "11:00 a.m."
    
Scenario: Forgetting valid data for block
    And I press "Submit Scheduling Block"
    Then I should see "Error: Could not create scheduling block."
    And I should see "Please enter a valid end time."
    
Scenario: Adding an invalid start time
    And I fill in "End Time" with "10:00 a.m."
    And I press "Submit Scheduling Block"
    Then I should see "Error: Could not create scheduling block."
    And I should see "Please enter a valid end time."
    
Scenario: Trying to edit as an incorrect users
    Then I follow "Profile"
    And I follow "Log Out"
    And I login as "notdaniel@gmail.com" with "password"
    Then I should be on the profile page for "notdaniel@gmail.com"
    And I should not see "Manage Test Clinic"
