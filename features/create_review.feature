Feature:
    As a user
    So that I can provide information about clinics to other users 
    I want to be able to write a review

Scenario: Create a new review
    Given I am on the reviews listing page
    When I follow "New Review"
    And I fill in "Title" with "Test Review"
    And I fill in "Body" with "Test Text"
    And I press "Create Review"
    Then I should see "Test Review"
    Then I should see "Test Text"
