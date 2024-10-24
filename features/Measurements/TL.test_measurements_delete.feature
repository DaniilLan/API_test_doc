@before.create.patient
@after.delete.patient
Feature: Test Delete Measurements - Telemed.Medworker

  @before.create.measurement
  @after.delete.measurement
  Scenario: Удаление измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(measurement_id)
    And API-token: doctor
    When method: DELETE
    Then status: 200

  @before.create.measurement
  @after.delete.measurement
  Scenario: Удаление измерения у не существующего пациета
    Given path: /api/v4/Me/Telemed.Medworker/Patients(111111)/MedicalCard/Measurements(measurement_id)
    And API-token: doctor
    When method: DELETE
    Then status: 404

  Scenario: Удаление не существующего измерения у пациета
    Given path: /api/v4/Me/Telemed.Medworker/Patients(patient_id)/MedicalCard/Measurements(1)
    And API-token: doctor
    When method: DELETE
    Then status: 400
