Feature: Test /api/v4/Users/...

  Scenario: Получить всех пользователей
    Given Отправка: valid API token
    When Отправка: method GET
    Then Ожидать: status 200
    And Ожидать: answer is not empty

  Scenario: Получить всех пользователей используя count=true
    Given Отправка: valid API token
    When Добавить: parameter count=true in GET request
    Then Ожидать: status 200
    And Ожидать: answer is not empty

  Scenario: Получить 10 пользователей используя top=10
    Given Отправка: valid API token
    When Добавить: parameter top=10 in GET request
    Then Ожидать: status 200
    And Ожидать: answer is not empty

  Scenario: Без авторизации
    Given Отправка: empty API token
    When Отправка: method GET
    Then Ожидать: status 401