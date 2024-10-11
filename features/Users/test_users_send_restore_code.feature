Feature: Отправить код для восстановления на почту пользователя

  Scenario: Отправить код для восстановления на почту пользователя
    Given path: /api/v4/Users/SendRestoreCode
    And API-token: doctor
    And json: {"email": "landan2001@mail.ru"}
    When method: POST
    Then status: 200

  Scenario: Отправить код для восстановления не указав email
    Given path: /api/v4/Users/SendRestoreCode
    And API-token: doctor
    And json: {"email": ""}
    When method: POST
    Then status: 400

  Scenario: Отправить код для восстановления не указав json
    Given path: /api/v4/Users/SendRestoreCode
    And API-token: doctor
    When method: POST
    Then status: 400
