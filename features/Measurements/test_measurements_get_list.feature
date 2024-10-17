Feature: Получение списка измерений

  Scenario: Получение списка измерений с фильтром
    Given path: /api/v4/Measurements?count=true
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty

  Scenario: Получение списка измерений
    Given path: /api/v4/Measurements
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty


  Scenario: Получение списка измерений
    Given path: /api/v4/Measurements
    And API-token: empty
    When method: GET
    Then status: 401

