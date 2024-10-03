Feature: Test /api/v4/Users(?)

  Scenario: Получение пользователя по id
    Given path /api/v4/Users(1)
    And valid API token
    When method GET
    Then status 200

  Scenario: Не указан ID
    Given path /api/v4/Users()
    And valid API token
    When method GET
    Then status 404

  Scenario: Не существующий пациент
    Given path /api/v4/Users(122222222)
    And valid API token
    When method GET
    Then status 404

  Scenario: Ошибка в запросе
    Given path /api/v4/Users(qwe)
    And valid API token
    When method GET
    Then status 400

  Scenario: Без авторизации
    Given path /api/v4/Users(1)
    And empty API token
    When method GET
    Then status 401
