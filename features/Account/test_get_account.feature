Feature: Получить доступные аккаунты для пользователя

  Scenario: Получить доступные аккаунты для пользователя
    Given path: /api/v4/Accounts
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty

  Scenario: Без авторизации
    Given path: /api/v4/Accounts
    And API-token: empty
    When method: GET
    Then status: 401