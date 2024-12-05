@before.create.patient
@after.delete.patient
Feature: Добавить комментарии к измерению

  @before.create.measurement
  @after.delete.measurement
  Scenario: Добавить комментарии к измерению
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: doctor
    And json: {"value": "123"}
    When method: POST
    Then status: 200

  @before.create.measurement
  @after.delete.measurement
  Scenario: Не указан комментарии
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: doctor
    And json: {"value": ""}
    When method: POST
    Then status: 400

  @before.create.measurement
  @after.delete.measurement
  Scenario: Длинный комментарии орг. 255 символов
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: doctor
    And json: {"value": "12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"}
    When method: POST
    Then status: 400

  @before.create.measurement
  @after.delete.measurement
  Scenario: Не указан ID измерения
    Given path: /api/v4/Measurements()/Comments
    And API-token: doctor
    And json: {"value": "12378901234567845678901234567890"}
    When method: POST
    Then status: 404

  @before.create.measurement
  @after.delete.measurement
  Scenario: Некорректный ID - test
    Given path: /api/v4/Measurements(test)/Comments
    And API-token: doctor
    And json: {"value": "12378901234567845678901234567890"}
    When method: POST
    Then status: 400

  @before.create.measurement
  @after.delete.measurement
  Scenario: Без авторизации
    Given path: /api/v4/Measurements(measurement_id)/Comments
    And API-token: empty
    And json: {"value": "12378901234567845678901234567890"}
    When method: POST
    Then status: 401
