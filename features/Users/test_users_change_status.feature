#Feature: Смена статуса пациента
#
#  Background:
#    * def myFeature = call read('T1.Auth.feature')
#    * def accessToken = myFeature.accessToken
#    * def apiUrl = myFeature.apiUrl
#    * def UserVid = myFeature.UserVid
#
#  Scenario: Смена статуса пациента
#    Given url apiUrl + '/api/v4/' + UserVid + '/ChangeStatus(status=1)'
#    And header Authorization = 'Bearer ' + accessToken
#    And header Content-Type = 'application/json'
#    When method POST
#    Then status 403
#
#
#    Given url apiUrl + '/api/v4/' + UserVid + '/ChangeStatus(status=0)'
#    And header Authorization = 'Bearer ' + accessToken
#    When method POST
#    Then status 403
