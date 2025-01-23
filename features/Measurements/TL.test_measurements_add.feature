@before.create.patient
Feature: Добавление измерений

  @after.delete.measurement
  Scenario: Добавление измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
    And API-token: doctor
    And json: [{"created": "2024-03-07T10:43:00+04:00", "source": "thermometer", "type": "temperature", "value": "37.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
    When method: POST
 #   And get: response.json()[measurement_id]
    Then status: 200

#  Scenario: Добавление измерения без авторизации
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: invalid
#    And json: create measurements
#    When method: POST
#    Then status: 401
#
#  Scenario: Добавление измерения не существующему пациету
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(22222)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: create measurements
#    When method: POST
#    Then status: 404
#
#  Scenario: Добавление измерения с невалидынм json
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2:00","source": "ma", "type": "iin","value": "0","parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    Then status: 400
#
#  Scenario: Добавление измерения с пусым json
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    When method: POST
#    Then status: 400
##
#  @after.delete.measurement
#  Scenario: manual - insulin
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-05-25T15:49:56+04:00","source": "manual", "type": "insulin","value": "8.0","parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: tonometer - blood_pressure
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:42:00+04:00", "source": "tonometer", "type": "blood_pressure", "value": "135/101", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: thermometer - temperature
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:43:00+04:00", "source": "thermometer", "type": "temperature", "value": "37.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: glucosemeter - glucose
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:44:00+04:00", "source": "glucosemeter", "type": "glucose", "value": "3.9", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: pulseoxymeter - pulse
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:45:00+04:00", "source": "pulseoxymeter", "type": "pulse", "value": "87", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: pulseoxymeter - spo2
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:45:50+04:00", "source": "pulseoxymeter", "type": "spo2", "value": "97", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: scales - weight
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:46:30+04:00", "source": "scales", "type": "weight", "value": "90", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: lung-tester - spirometry
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:47:20+04:00", "source": "lung-tester", "type": "spirometry", "value": "{\"fef25\":\"2.24\",\"fef2575\":\"2.47\",\"fef50\":\"2.51\",\"fef75\":\"2.5\",\"fev1\":\"2.77\",\"fev1/fvc\":\"82.9\",\"fvc\":\"3.9\",\"pef\":\"2.8\"}", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  Scenario: stethoscope - auscult
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: {"created": "2024-12-02T16:55:56+04:00", "source": "stethoscope", "type": "auscult", "value": "896070C92775F2B44F6365FAC9592F7E0D628FBC0D1D5110F83DD4F353233F1D", "parameters": [{"type": "mod.stethoscope.source", "value": "2"}]}
#    When method: POST
#    Then status: 200
##
#  @after.delete.measurement
#  Scenario: smartwatch - steps
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:52:35+04:00", "source": "smartwatch", "type": "steps", "value": "300", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: smartwatch - pulse
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:53:35+04:00", "source": "smartwatch", "type": "pulse", "value": "60", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: smartwatch - sleep
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-10T14:49:56+04:00", "source": "smartwatch", "type": "sleep", "value": "{\"dur\":[16,11,96,45,95,6,21,13,96],\"typ\":[\"l\",\"d\",\"l\",\"d\",\"l\",\"d\",\"l\",\"d\",\"l\"],\"st\":\"23:07\"}", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: breathalyzer - bac
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:55:25+04:00", "source": "breathalyzer", "type": "bac", "value": "0.13", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: manual - hemoglobin
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:57:25+04:00", "source": "manual", "type": "hemoglobin", "value": "10.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: manual - pucholesterollse
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:57:25+04:00", "source": "manual", "type": "cholesterol", "value": "5.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: manual - carbs
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:58:25+04:00", "source": "manual", "type": "carbs", "value": "7.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#  @after.delete.measurement
#  Scenario: manual - insulin
#    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements
#    And API-token: doctor
#    And json: [{"created": "2024-03-07T10:59:35+04:00", "source": "manual", "type": "insulin", "value": "8.0", "parameters": [{"type": "app.comment", "value": "тест"}]}]
#    When method: POST
#    And get: response.json()[measurement_id]
#    Then status: 200
#
#
#

