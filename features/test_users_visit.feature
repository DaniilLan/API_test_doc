Feature: Test /api/v4/Users(?)/Visit

  Scenario: Посетить карточку пациента
    Given path /api/v4/Users(1)/Visit
    And valid API token
    When method POST
    Then status 200

  Scenario: Посетить карточку пациента без авторизации
    Given path /api/v4/Users(1)/Visit
    And empty API token
    When method POST
    Then status 401
