Feature: Удаление пользователя

  @before.create.patient
  @after.delete.patient
  Scenario: Удаление пациента через Users(<key>)
    Given path: /api/v4/Users(patient_id)
    And API-token: doctor
    When method: DELETE
    Then status: 200

  @before.create.patient
  @after.delete.patient
  Scenario: Удаление пациента через Users/<key>
    Given path: /api/v4/Users/patient_id
    And API-token: doctor
    When method: DELETE
    Then status: 200


  Scenario: Не указан ID пациента
    Given path: /api/v4/Users()
    And API-token: doctor
    When method: DELETE
    Then status: 404


   Scenario: Указан ID не существующего пациента
    Given path: /api/v4/Users(999999)
    And API-token: doctor
    When method: DELETE
    Then status: 404

   Scenario: Некорретный ID пациента
    Given path: /api/v4/Users(qweqwe)
    And API-token: doctor
    When method: DELETE
    Then status: 404

  @before.create.patient
  @after.delete.patient
   Scenario: Без авторизации
    Given path: /api/v4/Users(patient_id)
    And API-token: empty
    When method: DELETE
    Then status: 401