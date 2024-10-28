Feature: Редактирование организации

  @before.create.org
  @after.delete.org
  Scenario: Редактирование организации
    Given path: /api/v4/Organizations(org_id)
    And API-token: doctor
    And json: {"email": "apiorg123@api.org"}
    When method: PATCH
    Then status: 403
