@before.create.patient
@after.delete.patient
Feature: Установка лимитов пользователя

  Scenario: Установка лимитов пользователя
    Given path: /api/v4/Users(patient_id)/Limits
    And API-token: doctor
    And json: [{ "min": 220.0, "max": 250.0, "measurementType": "blood_pressure_systolic"}, { "min": 20, "max": 220, "measurementType": "blood_pressure_diastolic"}, { "min": 0.0, "max": 200.0, "measurementType": "pulse"}, { "min": 0.0, "max": 35.0, "measurementType": "glucose"}, { "min": 0.0, "max": 35.0, "measurementType": "glucose_before"}, { "min": 0.0, "max": 35.0, "measurementType": "glucose_fasting"}, { "min": 0.0, "max": 35.0, "measurementType": "glucose_after"}, { "min": 30.0, "max": 45.0, "measurementType": "temperature"}]
    When method: POST
    Then status: 200
