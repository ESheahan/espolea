Feature:
    Given that I am a user
    So that I can receive treatment
    I should be able to schedule an appointment
    
Background:
    Given the following users exist:
    | first_name | last_name | email                | password |
    | Daniel     | Ahrens    | dahrens@berkeley.edu | password |
     
     
    #TODO: Update this step definition
    Given the following clinics exist:
    | name        | location     | municipality | state |
    | Test Clinic | Mexico City  | Something    | Uh    |
    
    #TODO: Create this step definition
    Given the following schedules exist:
    | start    | end       | clinic      | treatments               |
    | 2016-4-1 |11:00 a.m. | Test Clinic | clean_needles; methadone |
    
    Given I login as "dahrens@berkeley.edu" with "password"
    #TODO: Where should this link be?
    And I follow "Schedule Appointment"
    Then I should be on the appointment scheduling page
    When I fill in "Date" with "2016-4-1 11:00"
    And I fill in "City" with "Mexico City"
    And I fill in "Municipality" with "Something"
    And I fill in "State" with "Uh"
    
Scenario: Logged in and creating a valid appointment
    And I fill in "Reason" with "methadone"
    And I press "Find Appointment"
    Then I should be on the appointments listing page
    And I should see "methadone"
    
Scenario: Trying to schedule an appointment where no resources exist
    When I fill in "Reason" with "alcoholism"
    And I press "Find Appointment"
    Then I should be on the appointments listing page
    And I should see "Sorry, no appointments currently exist to fill your needs"
    And I should not see "Test Clinic"
    
Scenario: Trying to schedule an appointment without logging in (should redirect)
    When I follow "Welcome, dahrens@berkeley.edu"
    And I press "Log Out"
    And I follow "Schedule Appointment"
    Then I should be on the Login page
