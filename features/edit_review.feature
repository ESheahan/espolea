Feature:
    As a user
    So I can fix errors in a review
    I want to be able to edit and delete reviews

Background:
    Given the following reviews exist:
        | title       | rating      | text         |
        | Test Review | 5           | Nothing Here |
    Given I am on the reviews listing page

Scenario: Updating a review
    When I follow "Edit"
    And I fill in "Title" with "Best Review"
    And I press "Update Review"
    Then I should see "Best Review"

Scenario: Deleting a review
    When I follow "Destroy"
    Then I should be on the reviews listing page
    And I should not see "Test Review"
