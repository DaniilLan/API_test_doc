Feature: Удаление лимитов по умолчанию

  Scenario: Удаление лимитов по умолчанию
    Given path: /api/v4/Limits(1)
    And API-token: doctor
    And json: {"min": "3.9", "max": "10.0", "measurementType": "glucose"}
    When method: DELETE
    Then status: 403