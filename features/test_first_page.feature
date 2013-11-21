Feature: Skill test's front page

  As a user
  I want to see an overview for a skill test before I start it

  Scenario: Skill test has a front page with instructions and a start button
    Given 1 skill test
    When I navigate to the skill test's frontpage
    Then I should see the skill test's title
    And I should see the the skill test's instructions
    And I should see the number of questions the skill test has
    And I should see the start skill test button