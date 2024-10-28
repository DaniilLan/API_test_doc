@before.create.patient
@after.delete.patient
Feature: Назначить срочный осмотр на измерение

  @before.create.measurement
  @after.delete.measurement
  Scenario: Снять срочный осмотр на измерение
    Given path: /api/v4/Measurements(measurement_id)/UnsetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 200

  Scenario: Снять срочный осмотр не указав ID измерения
    Given path: /api/v4/Measurements()/UnsetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 404

  Scenario: Снять срочный осмотр с существующим ID измерения
    Given path: /api/v4/Measurements(999999)/UnsetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 404

  Scenario: Снять срочный осмотр с некорректным ID
    Given path: /api/v4/Measurements(qweqwe)/UnsetUrgentInspection
    And API-token: doctor
    When method: POST
    Then status: 400

  Scenario: Снять срочный осмотр без авторизации
    Given path: /api/v4/Measurements(12345)/UnsetUrgentInspection
    And API-token: empty
    When method: POST
    Then status: 401