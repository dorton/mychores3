Feature: User manages teams
  In order to be able to share my work between people
  As a user
  I want to create and manage teams

  Scenario: User creates a team
    Given I am signed in as a user called "aimee"
    When I go to the new team page
    And I fill in "Name" with "Household"
    And I fill in "Description" with "me and my homies"
    And I press "Create Team"
    Then there should be a team called "Household"
    And "aimee" should be a member of team "Household"

  Scenario: User edits a team
    Given I am signed in as a user called "aimee"
    And a team called "Household"
    And "aimee" is a member of team "Household"
    When I go to the edit team page for "Household"
    And I fill in "Name" with "Personal"
    And I press "Update Team"
    Then there should be a team called "Personal"

  Scenario: User cannot edit a team of which they are not a member
    Given I am signed in as a user called "aimee"
    And a team called "Household"
    When I go to the edit team page for "Household"
    Then I should see an error message
