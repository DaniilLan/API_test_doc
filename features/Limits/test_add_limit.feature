Feature: Добавление/изменение лимитов по умолчанию

  Scenario: Добавление/изменение лимитов по умолчанию
    Given path: /api/v4/Limits
    And API-token: doctor
    And json: {"min": "3.9", "max": "10.0", "measurementType": "glucose"}
    When method: POST
    Then status: 403
