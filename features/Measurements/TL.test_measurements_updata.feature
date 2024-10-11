@before.create.patient
@after.delete.patient
Feature: Изменение измерения

  @before.create.measurement
  Scenario: Изменение времени в измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(measurement_id)
    And json: {"created": "current_time"}
    And API-token: doctor
    When method: PATCH
    And get: response.json()[created]
    Then status: 200
    And check: value_before == value.after

  @before.create.measurement
  Scenario: Изменение прибора в измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(measurement_id)
    And json: {"source": "manual"}
    And API-token: doctor
    When method: PATCH
    And get: response.json()[source]
    Then status: 200
    And check: value_before == value.after

  Scenario: Изменение без указания id измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements()
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: doctor
    When method: PATCH
    Then status: 404

  Scenario: Изменение не существующего измерения измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(925555)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: doctor
    When method: PATCH
    Then status: 400
    # Статус код должен быть 404

  Scenario: Изменение не существующего измерения измерении
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(йцуйцу)
    And json: {"id": 0, "created": "2024-10-07T07:32:04.612Z", "source": "urine-analyzer", "type": "temperature", "value": "120", "parameters": [{"type": "app.comment", "value": "string123"}]}
    And API-token: doctor
    When method: PATCH
    Then status: 400

