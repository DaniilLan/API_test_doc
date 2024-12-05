@before.create.patient
@after.delete.patient
Feature: Получение комментариев измерения

  @before.create.measurement
  @after.delete.measurement
  Scenario: Получение комментариев измерения
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: doctor
    When method: GET
    Then status: 200

  @before.create.measurement
  @after.delete.measurement
  Scenario: Не указан ID
    Given path: /api/v4/Measurements()/Comments
    And API-token: doctor
    When method: GET
    Then status: 404

  @before.create.measurement
  @after.delete.measurement
  Scenario: Не существующий ID
    Given path: /api/v4/Measurements(333333333333)/Comments
    And API-token: doctor
    When method: GET
    Then status: 404

  @before.create.measurement
  @after.delete.measurement
   Scenario: Некорректный ID
    Given path: /api/v4/Measurements(test)/Comments
    And API-token: doctor
    When method: GET
    Then status: 400

  @before.create.measurement
  @after.delete.measurement
   Scenario: Без авторизации
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: empty
    When method: GET
    Then status: 401
