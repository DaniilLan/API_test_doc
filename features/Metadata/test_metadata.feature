Feature: получить Metadata

  Scenario: получить Metadata
    Given path: /api/v4/
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty
