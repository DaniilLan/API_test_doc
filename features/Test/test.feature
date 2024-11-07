#Feature: Test Get Users
#
#  Scenario Outline: Получить всех пользователей
#    Given path: /api/v4/Users/
#    And API-token: <token>
#    When method: GET
#    Then status: <expected_status>
#    And response json: is not empty
#  Examples:
#    | token   | expected_status |
#    | doctor  | 200             |
#    | admin   | 200             |
#
#  @before.create.patient
#  @after.delete.patient
#  Scenario Outline: Получить пользователя
#    Given path: /api/v4/Users(<params>)
#    And API-token: <token>
#    When method: GET
#    Then status: <expected_status>
#
#  Examples:
#    | token   | expected_status | params      | check_name                        |
#    | doctor  | 200             | patient_id  | Проверка доступа врача            |
#    | doctor  | 404             | 9999999     | Проверка несуществующего пациента |
#    | doctor  | 400             | qwe         | Проверка неверного ID             |
#    | doctor  | 404             |             | Проверка пустого ID               |
#    | empty   | 401             | patient_id  | Проверка без токена               |
#    | admin   | 200             | patient_id  | Проверка доступа администратора   |
#    | admin   | 404             | 9999999     | Проверка несуществующего пациента |
#    | admin   | 400             | qwe         | Проверка неверного ID             |
#    | admin   | 404             |             | Проверка пустого ID               |
#
#
