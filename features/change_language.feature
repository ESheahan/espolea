Feature:
    As a user
    So I can use the site in my native language
    I want to be able to switch languages

Scenario:
   Given I am on the home page
   And I change the language to "Spanish"
   Then I should see "Find My Clinic"
   When I change the language to "English"
   Then I should see "Find My Clinic"
