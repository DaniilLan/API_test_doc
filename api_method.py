import json
from random import choice

import requests
from methods import *


def get_token_user():
    login = "avtotest@avto.test"
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


def get_token_sup_adm():
    login = "admin"
    password = "test"
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


def get_token_doc():
    login = "landan2001@mail.ru"
    password = "123456789"
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


def get_token_adm():
    login = "TestLanAdm@mail.ru"
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


def get_user(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    response = requests.get(url=f'http://192.168.7.221:8081/api/v4/Users({user_id})', headers=headers)
    return response.json()


def create_measurement(patient_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    url = f'http://192.168.7.221:8081/api/v4/Me/Telemed.Medworker/Patients({patient_id})/MedicalCard/Measurements'
    data = generate_data_measurement()
    response = requests.post(url=url, headers=headers, json=data)
    if response.status_code == 200 or response.status_code == 201:
        try:
            return response.json()['value'][0]['id']
        except requests.exceptions.JSONDecodeError:
            return {"error": "Ошибка декодирования JSON", "response_text": response.text}
    else:
        return {"error": f"Ошибка запроса, статус код: {response.status_code}", "response_text": response.text}


def create_measurement_comment(patient_id):
    measurement_id = create_measurement(patient_id)
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    body = json.loads('{"value": "123"}')
    url = f"http://192.168.7.221:8081/api/v4/Users({patient_id})/Limits"
    response = requests.post(url=url, headers=headers, json=body)
    return response


def delete_measurement(user_id, measurement_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    url = f'http://192.168.7.221:8081/api/v4/Me/Telemed.Medworker/Patients({user_id})/MedicalCard/Measurements({measurement_id})'
    response = requests.delete(url=url, headers=headers)
    if response.status_code == 200 or response.status_code == 201:
        try:
            return response.json()
        except requests.exceptions.JSONDecodeError:
            return {"error": "Ошибка декодирования JSON", "response_text": response.text}
    else:
        return {"error": f"Ошибка запроса, статус код: {response.status_code}", "response_text": response.text}


def delete_all_patients(user_ids):
    results = {}
    for user_id in user_ids:
        response = delete_patient(user_id)
        results[user_id] = response.status_code  # Сохраняем статус код ответа для каждого ID
    return results


def get_id_measurement(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    url = f"http://192.168.7.221:8081/api/v4/Measurements?$filter=((user/id%20eq%20{user_id}))"
    response = requests.get(url=url, headers=headers)
    if response.status_code == 200 or response.status_code == 201:
        try:
            return response.json()
        except requests.exceptions.JSONDecodeError:
            return {"error": "Ошибка декодирования JSON", "response_text": response.text}
    else:
        return {"error": f"Ошибка запроса, статус код: {response.status_code}", "response_text": response.text}


def get_all_id_measurement(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    url = f"http://192.168.7.221:8081/api/v4/Measurements?$filter=((user/id%20eq%20{user_id}))"
    response = requests.get(url=url, headers=headers)

    if response.status_code == 200 or response.status_code == 201:
        try:
            data = response.json()
            list_id = [measurement['id'] for measurement in data.get('value', [])]
            return list_id
        except requests.exceptions.JSONDecodeError:
            return {"error": "Ошибка декодирования JSON", "response_text": response.text}
    else:
        return {"error": f"Ошибка запроса, статус код: {response.status_code}", "response_text": response.text}


def get_random_id_measurements(user_id):
    return choice(get_all_id_measurement(user_id))


def delete_all_measurements(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    measurement_ids = get_all_id_measurement(user_id)
    if isinstance(measurement_ids, list):
        for measurement_id in measurement_ids:
            url = f'http://192.168.7.221:8081/api/v4/Me/Telemed.Medworker/Patients({user_id})/MedicalCard/Measurements({measurement_id})'
            response = requests.delete(url=url, headers=headers)

            if response.status_code == 200 or response.status_code == 201:
                try:
                    print(f"Измерение с ID {measurement_id} успешно удалено.")
                except requests.exceptions.JSONDecodeError:
                    print(f"Ошибка декодирования JSON при удалении измерения с ID {measurement_id}")
            else:
                print(f"Ошибка при удалении измерения с ID {measurement_id}, статус код: {response.status_code}")
    else:
        print(f"Ошибка при получении списка измерений: {measurement_ids}")

def change_measurement(id_measurement):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;',
        'Request-Source': 'web',
    }
    body = {"id": 0,
            "created": "2024-05-01T09:56:01.623Z",
            "source": "urine-analyzer",
            "type": "temperature",
            "value": "100",
            "parameters": [
                {
                    "type": "app.comment",
                    "value": "string123"
                }
            ]}
    url = f"http://192.168.7.221:8081/api/v4/Me/Telemed.Medworker/Patients(1267)/MedicalCard/Measurements({id_measurement})"
    response = requests.patch(url=url, headers=headers, json=body)
    return response.json()


def create_doctor():
    headers = {
        "Authorization": f"Bearer {get_token_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    body = {
        "firstName": "Авто",
        "lastName": "Апи",
        "orgId": 101,
        "birthDate": "2001-10-07T08:07:18.113Z",
        "role": "doctor",
        "phone": random_phone(),
        "middleName": "Тест",
        "email": "avtotest@avto.test",
        "password": "12345678",
        "username": "avtotest",
        "sex": "male",
        "height": 100,
        "weight": 100,
        "avatar": "None"
    }
    url = f"http://192.168.7.221:8081/api/v4/Users/Register"
    response = requests.post(url=url, headers=headers, json=body)
    return response.json()


def change_doctor():
    headers = {
        "Authorization": f"Bearer {get_token_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    body = {
        "firstName": "Авто",
        "lastName": "Апи",
        "orgId": 101,
        "birthDate": "2001-10-07T08:07:18.113Z",
        "role": "doctor",
        "phone": random_phone(),
        "middleName": "Тест",
        "email": "avtotest@avto.test",
        "password": "12345678",
        "username": "avtotest",
        "sex": "male",
        "height": 100,
        "weight": 100,
        "avatar": "None"
    }
    url = f"http://192.168.7.221:8081/api/v4/Users"
    response = requests.patch(url=url, headers=headers, json=body)
    return response.json()


def create_patient():
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    body = {"firstName": "Ярослав",
            "lastName": "Ефимов",
            "middleName": "Владимирович",
            "height": 177,
            "weight": 70,
            "email": random_mail(),
            "phone": random_phone(),
            "birthDate": "1999-05-07",
            "sex": "male",
            "orgId": 3,
            "role": "patient",
            "id": 2424}
    url = f"http://192.168.7.221:8081/api/v4/Users/Register"
    response = requests.post(url=url, headers=headers, json=body)
    return response.json()['id']


def create_patient_limits():
    patient_id = create_patient()
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    body = json.loads('[{ "min": 220.0, "max": 250.0, "measurementType": "blood_pressure_systolic"},'
                      ' { "min": 20, "max": 220, "measurementType": "blood_pressure_diastolic"},'
                      ' { "min": 0.0, "max": 200.0, "measurementType": "pulse"},'
                      ' { "min": 0.0, "max": 35.0, "measurementType": "glucose"},'
                      ' { "min": 0.0, "max": 35.0, "measurementType": "glucose_before"},'
                      ' { "min": 0.0, "max": 35.0, "measurementType": "glucose_fasting"},'
                      ' { "min": 0.0, "max": 35.0, "measurementType": "glucose_after"},'
                      ' { "min": 30.0, "max": 45.0, "measurementType": "temperature"}]')
    url = f"http://192.168.7.221:8081/api/v4/Users({patient_id})/Limits"
    response = requests.post(url=url, headers=headers, json=body)
    return patient_id


def create_patient_diagnoses(param):
    patient_id = create_patient()
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    body = json.loads('[{"code": "I50", "parameters": '
                      '{"stage": "IIA", "accompanyingIllnesses": "Одышка, боли в спине"}}]')
    url = f"http://192.168.7.221:8081/api/v4/Users({patient_id})/Diagnoses"
    response = requests.post(url=url, headers=headers, json=body)
    if param == 'patient_id':
        return patient_id
    elif param == 'code':
        return response.json()['value'][0]['code']


def delete_user(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Users({user_id})"
    response = requests.delete(url=url, headers=headers)
    return response


def delete_patient(user_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Users({user_id})"
    response = requests.delete(url=url, headers=headers)
    return response


def change_status(user_id, status):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Users({user_id})/ChangeStatus(status={status})"
    response = requests.post(url=url, headers=headers)
    return response


def create_org():
    headers = {
        "Authorization": f"Bearer {get_token_sup_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Organizations"
    body = {
        "name": "Тестовая Орг",
        "address": "Самара123",
        "idExt": "99",
        "email": "apiorg@api.org",
        "phone": "8999966544",
        "parentId": 100
    }
    response = requests.post(url=url, headers=headers, json=body)
    return response.json()['id']


def delete_org(org_id):
    headers = {
        "Authorization": f"Bearer {get_token_sup_adm()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Organizations({org_id})"
    response = requests.delete(url=url, headers=headers)
    return response


def create_meetings(doctor_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Me/Meetings"
    body = {
        "name": "Апи встреча",
        "description": "Тестирование",
        "startDate": get_current_time_iso(),
        "endDate": get_current_time_iso(1),
        "invitedUserIds": [doctor_id]
    }
    response = requests.post(url=url, headers=headers, json=body)
    return response.json()['id']


def delete_meeting(meeting_id):
    headers = {
        "Authorization": f"Bearer {get_token_doc()}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    url = f"http://192.168.7.221:8081/api/v4/Me/Meetings({meeting_id})"
    response = requests.delete(url=url, headers=headers)
    return response


print(get_user(4024))

