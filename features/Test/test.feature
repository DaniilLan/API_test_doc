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
#@before.create.patient
#@after.delete.patient
#Scenario Outline: Получить пользователя
#  Given path: /api/v4/Users(<params>)
#  And API-token: <token>
#  When method: GET
#  Then status: <expected_status>
#Examples:
#  | token   | expected_status | params      |
#  | doctor  | 200             | patient_id  |
#  | doctor  | 404             | 9999999     |
#  | doctor  | 400             | qwe         |
#  | doctor  | 404             |             |
#  | empty   | 401             | patient_id  |
#  | admin   | 200             | patient_id  |
#  | admin   | 404             | 9999999     |
#  | admin   | 400             | qwe         |
#  | admin   | 404             |             |
#
#
