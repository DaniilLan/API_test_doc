Feature: Список организации с иерархией

  Scenario: Получение списка организаций с фильтрацией
    Given path: /api/v4/Organizations
    And API-token: doctor
    When method: GET
    Then status: 200

  Scenario: Получение списка организаций
    Given path: /api/v4/Organizations
    And API-token: doctor
    And parameters: count=true
    When method: GET
    Then status: 200
