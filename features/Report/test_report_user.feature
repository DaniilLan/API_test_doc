Feature: Получить отчет с измерениями по пациенту

  Scenario: Получить отчет с измерениями по пациенту
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2022-12-31,dateTo=2024-03-30,patientId=1267)
    And API-token: doctor
    When method: GET
    Then status: 200
    And response text: is not empty

  Scenario: Не указан ID пациента
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2022-12-31,dateTo=2024-03-30,patientId=)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Не указана начальная дата
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=,dateTo=2024-03-30,patientId=1267)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Не указана конечная дата
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2022-12-31,dateTo=,patientId=1267)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Невалидный период измерений
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2024-12-31,dateTo=2022-12-31,patientId=1267)
    And API-token: doctor
    When method: GET
    Then status: 400

  Scenario: Указан не существующий пациент
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2022-12-31,dateTo=2024-03-30,patientId=999999)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Без авторизации
    Given path: /api/v4/Reports/GetPatientReport(dateFrom=2022-12-31,dateTo=2024-03-30,patientId=1267)
    And API-token: empty
    When method: GET
    Then status: 401

