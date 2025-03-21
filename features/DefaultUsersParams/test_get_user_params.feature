Feature: Получить набор пользовательских параметров

  Scenario: Получение параметров
    Given path: /api/v4/Users/Parameters
    And API-token: admin
    When method: GET
    Then status: 200
    And response json: is not empty
