Feature: Изменение измерения

  Scenario: Изменение измерения
    Given path: /api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements(2559)
    And API-token: valid
    * value = get_random_value()
    And json: {"id": 0, "created": "2024-05-01T09:56:01.623Z", "source": "urine-analyzer", "type": "temperature", "value": "{random_value}", "parameters": [{"type": "app.comment", "value": "string123"}]}
    When method: PATCH
    Then status: 200

