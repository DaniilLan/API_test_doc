Feature: Создать видеовстречу

  @before.create.doctor
  @after.delete.doctor
  Scenario Outline: Создать видеовстречу
    Given path: /api/v4/Me/Meetings
    And API-token: <token>
    And json: {"name": "Апи встреча", "description": "Тестирование", "startDate": "<startDate>", "endDate": "<endDate>", "invitedUserIds": [<doctor_id>]}
    When method: POST
    Then status: <expected_status>
  Examples:
    | token   | expected_status | startDate            | startDate  | doctor_id  | check_name                                           |
    | doctor  | 200             | get_current_time_iso | meeting_id | meeting_id | Создать видеовстречу                                 |
    | doctor  | 400             | get_current_time_iso | meeting_id | meeting_id | Не указано название встречи                          |
    | doctor  | 400             | get_current_time_iso | meeting_id | meeting_id | Не указано участников встречи                        |
    | doctor  | 400             |                      |            |            | Не указано время начала                              |
    | doctor  | 400             | get_current_time_iso | 999999     | 999999     | Не указано время окончания                           |
    | doctor  | 400             | get_current_time_iso | meeting_id | meeting_id | Некорректный диапозон даты (start < now_data)        |
    | doctor  | 400             | get_current_time_iso |            |            | Некорректный диапозон времени (start_time > end_time)|
    | doctor  | 400             | get_current_time_iso |            |            | Некорректный диапозон времени (start_time < now_time)|
    | empty   | 401             | get_current_time_iso |            |            | Без авторизации                                      |

   Scenario: Не указано название встречи
    Given url apiUrl + '/api/v4/Me/Meetings'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {name: "", description: "opis", startDate: "2024-03-20T07:26:04.896Z", endDate: "2024-03-20T08:26:04.896Z", invitedUserIds": [105]}
    When method POST
    Then status 400

   Scenario: Не указано время начала
    Given url apiUrl + '/api/v4/Me/Meetings'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {name: "Тест", description: "opis", startDate: "", endDate: "2024-03-20T08:26:04.896Z", invitedUserIds": [105]}
    When method POST
    Then status 400

   Scenario: Не указано время окончания
    Given url apiUrl + '/api/v4/Me/Meetings'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {name: "Тест", description: "opis", startDate: "2024-03-20T07:26:04.896Z", endDate: "", invitedUserIds": [105]}
    When method POST
    Then status 400

   Scenario: Без авторизации
    Given url apiUrl + '/api/v4/Me/Meetings'
    And header Content-Type = 'application/json'
    And request {name: "Тест", description: "opis", startDate: "2024-03-20T07:26:04.896Z", endDate: "2024-03-20T08:26:04.896Z", invitedUserIds": [105]}
    When method POST
    Then status 401
