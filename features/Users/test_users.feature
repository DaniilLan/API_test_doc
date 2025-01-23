Feature: Test Get Users

#  Scenario: Получить всех пользователей
#    Given path: /api/v4/Users/
#    And API-token: doctor
#    When method: GET
#    Then status: 200
#    And response json: is not empty
#
#  Scenario: Получить всех пользователей используя count=true
#    Given path: /api/v4/Users/
#    And API-token: doctor
#    And parameters: count=true
#    When method: GET
#    Then status: 200
#    And response json: is not empty
#
#  Scenario: Получить 10 пользователей используя top=10
#    Given path: /api/v4/Users/
#    And API-token: doctor
#    And parameters: top=10
#    When method: GET
#    Then status: 200
#    And response json: is not empty
#
#  Scenario: Получить всех пользователей без авторизации
#    Given path: /api/v4/Users/
#    And API-token: empty
#    When method: GET
#    Then status: 401
#
  @before.create.doctor
  @after.delete.doctor
  Scenario: Получить пользователя (doctor) по id
    Given path: /api/v4/Users(doctor_id)
    And API-token: admin
    When method: GET
    Then status: 200

  @before.create.patient
  @after.delete.patient
  Scenario: Получить пользователя (patient) по id
    Given path: /api/v4/Users(patient_id)
    And API-token: doctor
    When method: GET
    Then status: 200

  Scenario: Получить пользователя не указав id
    Given path: /api/v4/Users()/
    And API-token: doctor
    When method: GET
    Then status: 404
#
#  Scenario: Получить не существующего пользователя
#    Given path: /api/v4/Users(122222222)
#    And API-token: doctor
#    When method: GET
#    Then status: 404
#
#  Scenario: Получить пользователя с ошибкой в запросе
#    Given path: /api/v4/Users(qwe)
#    And API-token: doctor
#    When method: GET
#    Then status: 400

  Scenario: Получить пользователя без авторизации
    Given path: /api/v4/Users(1)
    And API-token: empty
    When method: GET
    Then status: 401
