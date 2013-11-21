Feature: Test run

  As a user
  I want do a skill test

  Scenario: Start skill test
    Given 1 skill test
    And I'm in the skill test's frontpage
    And I press the start skill test button
    Then I should have started the skill test
    And I should see the first question
    And I should see the possible answers to that question

  @no-database-cleaner
  Scenario: Complete skill test and get time taken
    Given I have started a skill test with 2 questions
    When I take 60 seconds to complete the skill test with 1 correct answer
    Then my score should be 50.0%
    Then my time should be 01:00

  @no-database-cleaner
  Scenario: Get elapsed time in previous questions
    Given I have started a skill test with 2 questions
    When I take 30 seconds to answer the first question
    Then I should see I used 30 seconds