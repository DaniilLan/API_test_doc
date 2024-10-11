Feature: Смена пароля

  @before.create.doctor
  @after.delete.doctor
  Scenario: Смена пароля
    Given path: /api/v4/Users/ChangePassword
    And API-token: new_token
    And json: {"oldPassword": "12345678", "newPassword": "123456789", "confirmPassword": "123456789"}
    When method: POST
    Then status: 200

  @before.create.doctor
  @after.delete.doctor
  Scenario: Не указан старый пароль
    Given path: /api/v4/Users/ChangePassword
    And API-token: new_token
    And json: {"oldPassword": "", "newPassword": "123456789", "confirmPassword": "123456789"}
    When method: POST
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Не указан новый пароль
    Given path: /api/v4/Users/ChangePassword
    And API-token: new_token
    And json: {"oldPassword": "12345678", "newPassword": "", "confirmPassword": "123456789"}
    When method: POST
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Не указан повторно новый пароль
    Given path: /api/v4/Users/ChangePassword
    And API-token: new_token
    And json: {"oldPassword": "12345678", "newPassword": "123456789", "confirmPassword": ""}
    When method: POST
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Без авторизации
    Given path: /api/v4/Users/ChangePassword
    And API-token: empty
    And json: {"oldPassword": "12345678", "newPassword": "123456789", "confirmPassword": "123456789"}
    When method: POST
    Then status: 401