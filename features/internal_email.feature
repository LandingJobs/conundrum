Feature: Emailing results

  Background:
    Given 1 user
    And I am logged in as that user

  @no-database-cleaner
  Scenario: Completing skill test sends internal email
    Given the user has completed a skill test
    Then I should receive an email with the user's skill test results