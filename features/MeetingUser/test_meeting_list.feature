Feature: Список созданных ВКС

  @before.create.doctor
  @after.delete.doctor
  @before.create.meeting
  @after.delete_meeting
  Scenario: Список созданных ВКС
    Given path: /api/v4/Me/Meetings
    And API-token: doctor
    When method: GET
    Then status: 200

   Scenario: Без авторизации
    Given path: /api/v4/Me/Meetings
    And API-token: empty
    When method: GET
    Then status: 401


