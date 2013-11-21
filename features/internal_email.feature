Feature: Emailing results

  @no-database-cleaner
  Scenario: Completing skill test sends internal email
    Given a user has completed a skill test
    Then I should receive an email with the user's skill test results