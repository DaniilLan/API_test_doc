Feature: Редактирование пользователя

  Scenario: Редактирование пользователя
    Given url apiUrl + 'api/v4/Users/Register'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {email: "testRegApi2000@ts.ru", username: "testRegApi2000@ts.ru", firstName: "Петр", middleName: "Васильевич", lastName: "Родинов", phone: "1234567890", orgId: "#(variables.orgId)", sex: "male", birthDate: "2000-01-01T00:00:00", status: "Active", height: 150, weight: 150, role: "patient", password: "12345678"}
    When method POST
    Then status 200
    And def userId = response.id
    * print 'User ID:', userId

    Given url apiUrl + '/api/v4/Users(' + userId + ')'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {email: "testRegApi1566p@ts.ru", username: "testRegApi1566p@ts.ru", firstName: "Петр", middleName: "Васильевич", lastName: "Боров", phone: "1234567890"}
    When method PATCH
    Then status 200

    Given url apiUrl + '/api/v4/Users/' + userId
    And header Authorization = 'Bearer ' + accessToken
    When method DELETE
    Then status 200

  Scenario: Не существующий пациент
    Given url apiUrl + '/api/v4/Users(99999)'
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {email: "testRegApi156p@ts.ru", username: "testRegApi156p@ts.ru", firstName: "Петр", middleName: "Васильевич", lastName: "Родинов", phone: "1234567890", orgId: "#(variables.orgId)", sex: "male", birthDate: "2000-01-01T00:00:00", status: "Active", height: 150, weight: 150, role: "patient", password: "12345678"}
    When method PATCH
    Then status 404

  Scenario: Неверный формат адреса электронной почты
    Given url apiUrl + '/api/v4/' + UserVid
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {email: "test"}
    When method PATCH
    Then status 400

  Scenario: Некорректное имя
    Given url apiUrl + '/api/v4/' + UserVid
    And header Authorization = 'Bearer ' + accessToken
    And header Content-Type = 'application/json'
    And request {firstName: "Slava"}
    When method PATCH
    Then status 400
