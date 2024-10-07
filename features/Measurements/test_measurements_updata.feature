Feature: Изменение измерения

  Scenario: Изменение времени в измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(2559)
    And json: {"id": 0, "created": "current_time", "source": "urine-analyzer", "type": "temperature", "value": "100", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    And get: response.json()[created]
    Then status: 200
    And check: value_before == value.after

  Scenario: Изменение прибора в измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(2559)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "manual", "type": "temperature", "value": "100", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    And get: response.json()[source]
    Then status: 200
    And check: value_before == value.after

  Scenario: Изменение значения-измерения в измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(2559)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    And get: response.json()[value]
    Then status: 200
    And check: value_before == value.after

  Scenario: Изменение без указания id измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements()
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    Then status: 404

  Scenario: Изменение не существующего измерения измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(925555)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    Then status: 400
    # Статус код должен быть 404

  Scenario: Изменение не существующего измерения измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(йцуйцу)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: valid
    When method: PATCH
    Then status: 400

  Scenario: Изменение не существующего измерения измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(925555)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: empty
    When method: PATCH
    Then status: 401

