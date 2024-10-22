Feature: Добавление организации

  Scenario: Добавление организации
    Given path: /api/v4/Organizations
    And API-token: doctor
    And json: {"name": "Тестовая Орг", "address": "Самара123", "idExt": "99", "email": "apiorg@api.org", "phone": "8999966544", "parentId": 100}
    When method: POST
    Then status: 403
