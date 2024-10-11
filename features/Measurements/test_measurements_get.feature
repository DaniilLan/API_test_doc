@before.create.patient
@after.delete.patient
Feature: Получение измерения по ID

  @before.create.measurement
  Scenario: Получение измерения по ID через Measurements(<key>)
    Given path: /api/v4/Measurements(measurement_id)
    And API-token: doctor
    When method: GET
    Then status: 200
    And answer: is not empty

  @before.create.measurement
  Scenario: Получение измерения по ID через Measurements/<key>
    Given path: /api/v4/Measurements/measurement_id
    And API-token: doctor
    When method: GET
    Then status: 200
    And answer: is not empty

  Scenario: Получение измерения не указав ID измерения
    Given path: /api/v4/Measurements()
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Получение измерения не существующего измерения
    Given path: /api/v4/Measurements(999999)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Получение измерения с некорректным ID
    Given path: /api/v4/Measurements(qweqwe)
    And API-token: doctor
    When method: GET
    Then status: 400

  Scenario: Получение измерения без авторизации
    Given path: /api/v4/Measurements(1234)
    And API-token: empty
    When method: GET
    Then status: 401
