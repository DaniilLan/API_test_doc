Feature: Разлогирование пользователя

  Scenario: Разлогирование пользователя
    Given path: /api/v4/Users/Telemed.Logout
    And API-token: doctor
    When method: POST
    Then status: 200