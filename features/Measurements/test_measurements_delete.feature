Feature: Test Delete Measurements - Telemed.Medworker

  Scenario: Удаление измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(id_measurements)
    And API-token: valid
    When method: DELETE
    Then status: 200

  Scenario: Удаление измерения у не существующего пациета
    Given path: /api/v4/Me/Telemed.Medworker/Patients(111111)/MedicalCard/Measurements(id_measurements)
    And API-token: valid
    When method: DELETE
    Then status: 404

  Scenario: Удаление не существующего измерения у пациета
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(1)
    And API-token: valid
    When method: DELETE
    Then status: 400
