@before.create.patient_limits
@after.delete.patient_limits
Feature: Получение лимитов по Пользователю

  Scenario: Получение лимитов по Пользователю
    Given path: /api/v4/Users(patient_id)/Limits
    And API-token: doctor
    When method: GET
    Then status: 200
    And response json: is not empty
  
   Scenario: Не указан ID пациента
    Given path: /api/v4/Users()/Limits
    And API-token: doctor
    When method: GET
    Then status: 404
    
   Scenario: Указан ID не существующего пациента
    Given path: /api/v4/Users(999999)/Limits
    And API-token: doctor
    When method: GET
    Then status: 404
    
   Scenario: Некорректный ID пациента
    Given path: /api/v4/Users(test)/Limits
    And API-token: doctor
    When method: GET
    Then status: 404

   Scenario: Без авторизации
    Given path: /api/v4/Users(patient_id)/Limits
    And API-token: empty
    When method: GET
    Then status: 401