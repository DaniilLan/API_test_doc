Feature: Получение лимитов по умолчанию

  Scenario: Получение лимитов по умолчанию с фильтром
    Given path: /api/v4/Limits?orderby=id
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty
    
   Scenario: Получение лимитов по умолчанию
    Given path: /api/v4/Limits
    And API-token: doctor
    When method: GET
    Then status: 200

   Scenario: Без авторизации
    Given path: /api/v4/Limits
    And API-token: empty
    When method: GET
    Then status: 401