Feature: Test /api/v4/Users

  Scenario: Получить всех пользователей
    Given path /api/v4/Users/
    And valid API token
    When method GET
    Then status 200
    And answer is not empty

  Scenario: Получить всех пользователей используя count=true
    Given path /api/v4/Users/
    And valid API token
    When parameter count=true in GET request
    Then status 200
    And answer is not empty

  Scenario: Получить 10 пользователей используя top=10
    Given path /api/v4/Users/
    And valid API token
    When parameter top=10 in GET request
    Then status 200
    And answer is not empty

  Scenario: Без авторизации
    Given path /api/v4/Users/
    And empty API token
    When method GET
    Then status 401