@before.create.patient
@after.delete.patient
Feature: Назначить срочный осмотр на измерение

  @before.create.measurement
  @after.delete.measurement
  Scenario: Назначить срочный осмотр на измерение
    Given path: /api/v4/Measurements(measurement_id)/SetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 200

  Scenario: Назначить срочный осмотр не указав ID измерения
    Given path: /api/v4/Measurements()/SetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 404

  Scenario: Назначить срочный осмотр с существующим ID измерения
    Given path: /api/v4/Measurements(999999)/SetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 404

  Scenario: Назначить срочный осмотр с некорректным ID
    Given path: /api/v4/Measurements(qweqwe)/SetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 400

  Scenario: Назначить срочный осмотр без авторизации
    Given path: /api/v4/Measurements(12345)/SetUrgentInspection
    And API-token: empty
    When method: POST
    Then status: 401