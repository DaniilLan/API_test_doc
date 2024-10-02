Feature: Get users from API

  Scenario: Get all users
    Given I have a valid API token
    When I send a GET request to the API
    Then the response status code should be 200
    And the response should not be empty

  Scenario: Get all users with count filter
    Given I have a valid API token
    When I send a GET request to the API with count filter
    Then the response status code should be 200
    And the response should not be empty

  Scenario: Get top 10 users
    Given I have a valid API token
    When I send a GET request to the API with top 10 filter
    Then the response status code should be 200
    And the response should not be empty
