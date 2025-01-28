Feature: Получение списка уведомлений

  @before.create.doctor
  @after.delete.doctor
  Scenario: Получение списка уведомлений
    Given path: /api/v4/Users(doctor_id)/Notifications
    And API-token: new_token
    When method: GET
    Then status: 200

  @before.create.doctor
  @after.delete.doctor
  Scenario: Указан ID не авторизованного доктора
    Given path: /api/v4/Users(1267)/Notifications
    And API-token: new_token
    When method: GET
    Then status: 403

  @before.create.doctor
  @after.delete.doctor
  Scenario: Указан некорректный ID
    Given path: /api/v4/Users(qweqwe)/Notifications
    And API-token: new_token
    When method: GET
    Then status: 404

  @before.create.doctor
  @after.delete.doctor
  Scenario: Указан не существующий ID
    Given path: /api/v4/Users(999999)/Notifications
    And API-token: new_token
    When method: GET
    Then status: 403

  @before.create.doctor
  @after.delete.doctor
  Scenario: Без авторизации
    Given path: /api/v4/Users(doctor_id)/Notifications
    And API-token: empty
    When method: GET
    Then status: 401