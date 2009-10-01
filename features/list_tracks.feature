Feature: List tracks
  In order to see the tracks
  As a user
  I want to list the tracks
  
  Scenario: Tracks list
    Given I have tracks titled Track 1, Track 2
    When I go to the list of tracks
    Then I should see "Track 1"
    And I should see "Track 2"
  
  Scenario: Follow latest tracks link
    Given I have tracks titled Track 1
    And I am on the homepage
    When I follow "Latest tracks"
    Then I should see "Track 1"
  
  Scenario: Follow track link
    Given I have tracks titled Track 1
    Given I have an artist named "Test"
    And I am on the homepage
    When I follow "Track 1"
    Then I should see "Track"