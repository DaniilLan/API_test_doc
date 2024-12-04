###
  # ПОКА НЕ ИСПОЛЬЗУЮТСЯ
  # ТЕСТ НЕ ПРОГОНЯТЬ !!!
###

# @before.create.patient
#@after.delete.patient
#Feature: Добавить/Получить/Удалить диагнозы пациента
#
#  @before.create.patient
#  @after.delete.patient
#  Scenario: Добавить диагноз пациента
#    Given path: /api/v4/Users(patient_id)/Diagnoses
#    And API-token: doctor
#    And json: [{"code": "I50", "parameters": {"stage": "IIA", "accompanyingIllnesses": "Одышка, боли в спине"}}]
#    When method: POST
#    Then status: 200
#
#  @before.create.patient
#  @after.delete.patient
#  Scenario: Получить диагноз пациента
#    Given path: /api/v4/Users(patient_id)/Diagnoses
#    And API-token: doctor
#    When method: GET
#    Then status: 200
#
#  @before.create.patient_diagnoses
#  @after.delete.patient_diagnoses
#  Scenario: Удалить диагноз пациента
#    Given path: /api/v4/Users(patient_id)/Diagnoses
#    And API-token: doctor
#    And json: [{"code": "diagnoses_code"}]
#    When method: DELETE
#    Then status: 200