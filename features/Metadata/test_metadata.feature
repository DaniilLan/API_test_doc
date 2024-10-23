Feature: получить Metadata

  Scenario: получить Metadata
    Given path: /api/v4/
    And API-token: doctor
    When method: GET
    Then status: 200
    Then response json: is not empty
