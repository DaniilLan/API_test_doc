Feature: Список организации с иерархией

  Scenario: Список организации с иерархией
    Given path: /api/v4/Organizations(100)/GetHierarchy
    And API-token: doctor
    When method: GET
    Then status: 200

  Scenario: Не указан ID организации
    Given path: /api/v4/Organizations()/GetHierarchy
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Не существующий ID организации
    Given path: /api/v4/Organizations(99999)/GetHierarchy
    And API-token: doctor
    When method: GET
    Then status: 400

  Scenario: Некорректный ID организации
    Given path: /api/v4/Organizations(qweqwe)/GetHierarchy
    And API-token: doctor
    When method: GET
    Then status: 400

  Scenario: Без авторизации
    Given path: /api/v4/Organizations(100)/GetHierarchy
    And API-token: empty
    When method: GET
    Then status: 401
