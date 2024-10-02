import requests
import pytest
from api_method import *
# Обычные запросы


def test_get_users(headers, api_token):
    response = requests.get(
        url=f"{api_token}",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


def test_get_users_filter_count(headers, api_token):
    response = requests.get(
        url=f"{api_token}?$count=true",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


def test_get_users_filter_top(headers, api_token):
    response = requests.get(
        url=f"{api_token}?$top=10",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


if __name__ == "__main__":
    pytest.main()
