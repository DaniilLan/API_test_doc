Feature: Test Users

  Scenario: Получить всех пользователей
    Given path: /api/v4/Users/
    And API-token: valid
    When method: GET
    Then status: 200
    And answer: is not empty

  Scenario: Получить всех пользователей используя count=true
    Given path: /api/v4/Users/
    And API-token: valid
    When method: GET
    When parameters: count=true
    Then status: 200
    And answer: is not empty

  Scenario: Получить 10 пользователей используя top=10
    Given path: /api/v4/Users/
    And API-token: valid
    When method: GET
    When parameters: top=10
    Then status: 200
    And answer: is not empty

  Scenario: Получить всех пользователей без авторизации
    Given path: /api/v4/Users/
    And API-token: empty
    When method: GET
    Then status: 401

  Scenario: Получить пользователя по id
    Given valid user_id
    And path: /api/v4/Users(user_id)
    And API-token: valid
    When method: GET
    Then status: 200

  Scenario: Получить пользователя не указав id
    Given path: /api/v4/Users()/
    And API-token: valid
    When method: GET
    Then status: 404

  Scenario: Получить не существующего пользователя
    Given path: /api/v4/Users(122222222)
    And API-token: valid
    When method: GET
    Then status: 404

  Scenario: Получить пользователя с ошибкой в запросе
    Given path: /api/v4/Users(qwe)
    And API-token: valid
    When method: GET
    Then status: 400

  Scenario: Получить пользователя без авторизации
    Given path: /api/v4/Users(1)
    And API-token: empty
    When method: GET
    Then status: 401
