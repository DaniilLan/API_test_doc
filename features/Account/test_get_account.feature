Feature: Получить доступны аккаунты для пользователя

  Scenario: Получить доступны аккаунты для пользователя
    Given path: /api/v4/Accounts
    And API-token: doctor
    When method: GET
    Then status: 200

  Scenario: Без авторизации
    Given path: /api/v4/Accounts
    And API-token: empty
    When method: GET
    Then status: 401
