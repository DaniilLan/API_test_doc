Feature: Удаление всех уведомлений для пользователя

  @before.create.doctor
  @after.delete.doctor
  Scenario: Удаление всех уведомлений
    Given path: /api/v4/Users(doctor_id)/Notifications
    And API-token: new_token
    When method: DELETE
    Then status: 200

  @before.create.doctor
  @after.delete.doctor
  Scenario: Удаление всех уведомлений указав некорректный ID
    Given path: /api/v4/Users(qweqwe)/Notifications
    And API-token: new_token
    When method: DELETE
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Удаление всех уведомлений указав не существующий ID
    Given path: /api/v4/Users(9999999)/Notifications
    And API-token: new_token
    When method: DELETE
    Then status: 403

  @before.create.doctor
  @after.delete.doctor
  Scenario: Удаление всех уведомлений без авторизации
    Given path: /api/v4/Users(9999999)/Notifications
    And API-token: new_token
    When method: DELETE
    Then status: 403