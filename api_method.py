import requests
from methods import generate_data


def get_token_doc():
    login = "landan2001@mail.ru"
    password = "12345678"
    req_url = "http://192.168.7.221:8081/api/v4/Users/Login"
    headers = {
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    data = {
        'email': login,
        'password': password,
    }
    response = requests.post(url=req_url, headers=headers, json=data)
    return response.json()["accessToken"]


def get_users():
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    response = requests.get(url='http://192.168.7.221:8081/api/v4/Users', headers=headers)
    user_ids = [user['id'] for user in response.json().get('value', [])]
    return user_ids


def create_measurement():
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = 'http://192.168.7.221:8081/api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements'
    data = generate_data()
    response = requests.post(url=url, headers=headers, json=data)
    if response.status_code == 200 or response.status_code == 201:
        try:
            return response.json()
        except requests.exceptions.JSONDecodeError:
            return {"error": "Ошибка декодирования JSON", "response_text": response.text}
    else:
        return {"error": f"Ошибка запроса, статус код: {response.status_code}", "response_text": response.text}



