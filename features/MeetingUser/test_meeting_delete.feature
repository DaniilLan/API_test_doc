Feature: Удалить созданную видеовстречу

  @before.create.doctor
  @after.delete.doctor
  @before.create.meeting
  @after.delete.meeting
  Scenario Outline: Удалить созданную видеовстречу
    Given path: /api/v4/Me/Meetings(<params>)
    And API-token: <token>
    When method: DELETE
    Then status: <expected_status>
  Examples:
    | token      | expected_status | params      | check_name                                          |
    | doctor     | 200             | meeting_id  | Удалить созданную видеовстречу                      |
    | new_token  | 403             | meeting_id  | Удалить видеовстречу созданную другим пользователем |
    | doctor     | 404             |             | Не указан ID ВКС                                    |
    | doctor     | 404             | 999999      | Указан ID не существующей ВКС                       |
    | empty      | 401             | meeting_id  | Без авторизации                                     |
