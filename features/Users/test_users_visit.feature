Feature: Test Users - Visit

  Scenario: Посетить карточку пациента
    Given path: /api/v4/Users(1267)/Visit
    And API-token: valid
    When method: POST
    Then status: 200

  Scenario: Посетить карточку несуществующего пациента
    Given path: /api/v4/Users(11111111111111111)/Visit
    And API-token: valid
    When method: POST
    Then status: 404

  Scenario: Посетить карточку пациента без авторизации
    Given path: /api/v4/Users(1)/Visit
    And API-token: empty
    When method: POST
    Then status: 401
