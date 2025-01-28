Feature: Смена статуса пациента

  @before.create.patient
  @after.delete.patient
  Scenario: Смена статуса пациента
    Given path: /api/v4/Users(patient_id)/CangeStatus(Archive)
    And API-token: doctor
    When method: POST
    Then status: 200
