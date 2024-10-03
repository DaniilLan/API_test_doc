import pytest
from api_method import *
# Обычные запросы


ACCESS_TOKEN = get_token_doc()
url = "http://192.168.7.221:8081/api/v4/Users"
headers = {
            "Authorization": f"Bearer {ACCESS_TOKEN}",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }


def test_get_users():
    response = requests.get(
        url=f"{url}",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


def test_get_users_filter_count():
    response = requests.get(
        url=f"{url}?$count=true",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


def test_get_users_filter_top():
    response = requests.get(
        url=f"{url}?$top=10",
        headers=headers)
    print(response.json())
    assert response.status_code == 200
    assert response.json()["value"] != []


if __name__ == "__main__":
    pytest.main()
