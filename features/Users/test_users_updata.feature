Feature: Редактирование пользователя

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение даты рождения пользователя
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "current time", "role": "doctor", "phone": "9622777220", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 200


  Scenario: Изменение не существующего пользователя
    Given path: /api/v4/Users(9999)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "2001-10-07T08:07:18.113Z", "role": "doctor", "phone": "9622299222", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 404

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с невалидным значением birthDate
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "123", "role": "doctor", "phone": "9622442222", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с пустым послем birthDate
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "Апи", "orgId": 101, "birthDate": "", "role": "doctor", "phone": "9622255522", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с невалидным полем firstName
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто1","lastName": "Апи", "orgId": 101, "birthDate": "2001-10-07T08:07:18.113Z", "role": "doctor", "phone": "9622277722", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с пустым полем firstName
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "","lastName": "Апи", "orgId": 101, "birthDate": "2001-10-07T08:07:18.113Z", "role": "doctor", "phone": "9622636322", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с невалидным полем lastName
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "Апи1", "orgId": 101, "birthDate": "2001-10-07T08:07:18.113Z", "role": "doctor", "phone": "9622877722", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400

  @before.create.doctor
  @after.delete.doctor
  Scenario: Изменение пользователя с пустым полем lastName
    Given path: /api/v4/Users(doctor_id)
    And json: {"firstName": "Авто","lastName": "", "orgId": 101, "birthDate": "2001-10-07T08:07:18.113Z", "role": "doctor", "phone": "9622299922", "middleName": "Тест", "email": "avtotest@avto.test", "password": "12345678", "username": "avtotest", "sex": "male", "height": 100, "weight": 100, "avatar": "None"}
    And API-token: admin
    When method: PATCH
    Then status: 400
