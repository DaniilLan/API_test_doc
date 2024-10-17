Feature: Получить отчет с измерениями

  Scenario: Получить отчет с измерениями
    Given path: /api/v4/Reports/GetStatisticsReportFull(dateFrom=2022-12-31,dateTo=2024-03-30)
    And API-token: doctor
    When method: GET
    Then status: 200
    And response text: is not empty

  Scenario: Не указана начальная дата
    Given path: /api/v4/Reports/GetStatisticsReportFull(dateFrom=,dateTo=2024-03-30)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Невалидный период измерений
    Given path: /api/v4/Reports/GetStatisticsReportFull(dateFrom=2024-04-30,dateTo=2024-03-30)
    And API-token: doctor
    When method: GET
    Then status: 400

  Scenario: Не указана конечная дата
    Given path: /api/v4/Reports/GetStatisticsReportFull(dateFrom=2024-03-30,dateTo=)
    And API-token: doctor
    When method: GET
    Then status: 404

  Scenario: Без авторизации
    Given path: /api/v4/Reports/GetStatisticsReportFull(dateFrom=2024-03-30,dateTo=2024-05-30)
    And API-token: empty
    When method: GET
    Then status: 401
