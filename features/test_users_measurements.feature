Feature: Test /api/v4/Users/Measurements

  Scenario: Добавление измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements
    And API-token: valid
    And json: create measurements
    When method: POST
    Then status: 200

  Scenario: Добавление измерения с невалидынм json
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements
    And API-token: valid
    And json: '123'
    When method: POST
    Then status: 400

  Scenario: Добавление измерения с пусым json
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements
    And API-token: valid
    And json: ''
    When method: POST
    Then status: 400


