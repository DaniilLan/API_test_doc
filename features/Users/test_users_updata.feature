Feature: Редактирование пользователя

  Scenario: Изменение даты рождения пользователя
    #Создание доктора для дальнейших изменений
    Given create: doctor

    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    And get: response.json()[birthDate]
    Then status: 200
    And check: value_before == value.after

    #Удаление доктора после изменений
    Then delete: doctor

  Scenario: Изменение не существующего пользователя
    Given path: /api/v4/Users(9999)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 404

  Scenario: Изменение пользователя невалидным значением birthDate
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  Scenario: Изменение пользователя невалидным значением role
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "d", "phone": "9688888888", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  Scenario: Изменение пользователя невалидным значением phone
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "0", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  Scenario: Изменение пользователя невалидным значением orgId
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 1, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 403

  Scenario: Изменение пользователя невалидным значением lastName
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи1", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  Scenario: Изменение пользователя невалидным значением password
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2002-10-07T08:07:18.113Z", "role": "doctor", "phone": "9688888888", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "avtotest1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 200

  Scenario: Изменение пользователя невалидным значением username
    Given path: /api/v4/Users(1267)
    And json: {"firstName": "Авто","lastName": "Апи1", "orgId": 1, "birthDate": "2002-10-07T08:07:18.113Z", "role": "d", "phone": "0", "middleName": "Тест", "email": "avtotest1@avto.test", "password": "12345678", "username": "1", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400