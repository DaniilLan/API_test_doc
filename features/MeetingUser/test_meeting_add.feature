Feature: Создать видеовстречу

  @before.create.doctor
  @after.delete.doctor
  Scenario Outline: Создать видеовстречу
    Given path: /api/v4/Me/Meetings
    And API-token: <token>
    And json: {"name": "<name_meeting>", "description": "<description_meet>", "startDate": "<startDate>", "endDate": "<endDate>", "invitedUserIds": ["<doctors_id>"]}
    When method: POST
    Then status: <expected_status>
  Examples:
    | token   | expected_status | name_meeting | description_meet | startDate              | endDate                | doctors_id | check_name                                           |
    | doctor  | 200             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | doctor_id  | Создать видеовстречу                                 |
#    | doctor  | 200             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | doctor_id  | Не указано описание встречи                          |
#    | doctor  | 400             |              | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | doctor_id  | Не указано название встречи                          |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 |            | Не указаны участники встречи                         |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | qweqwe     | Не корректный id участника встречи                   |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | 999999     | Не существующий id участника встречи                 |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  |                        | get_current_time_iso+2 | doctor_id  | Не указано время начала                              |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 |                        | doctor_id  | Не указано время окончания                           |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso   | get_current_time_iso+1 | doctor_id  | Некорректный диапозон времени (start_time = now_time)|
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso-1 | get_current_time_iso+1 | doctor_id  | Некорректный диапозон времени (start_time < now_time)|
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+2 | get_current_time_iso+1 | doctor_id  | Некорректный диапозон времени (start_time > end_time)|
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+1 | doctor_id  | Некорректный диапозон времени (start_time = end_time)|
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso   | doctor_id  | Некорректный диапозон времени (end_time = now_time)  |
#    | doctor  | 400             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso-1 | doctor_id  | Некорректный диапозон времени (end_time < now_time)  |
#    | invalid | 403             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | doctor_id  | Чужой токен доступа                                  |
#    | empty   | 401             | Namemeet     | Descriptionmeet  | get_current_time_iso+1 | get_current_time_iso+2 | doctor_id  | Без авторизации                                      |
