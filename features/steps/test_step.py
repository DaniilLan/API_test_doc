from random import choice
from behave import given, when, then, fixture, use_fixture
import requests
from api_method import *
from methods import *
import json

ACCESS_TOKEN_DOCTOR = get_token_doc()
ACCESS_TOKEN_ADMIN = get_token_adm()


@given('value = get_random_value()')
def step_impl(context):
    context.value = get_random_value()


@given("path: {path}")
def step_impl(context, path):
    if "measurement_id" in path:
        path = path.replace("measurement_id", str(context.measurement_id))
    if "doctor_id" in path:
        path = path.replace("doctor_id", str(context.doctor_id))
    if "patient_id" in path:
        path = path.replace("patient_id", str(context.patient_id))
    if "org_id" in path:
        path = path.replace("org_id", str(context.org_id))
    if "meeting_id" in path:
        path = path.replace("meeting_id", str(context.meeting_id))
    context.url = f"http://192.168.7.221:8081{path}"
    context.body = {}
    context.params = {}


@given("API-token: {type_token}")
def step_impl(context, type_token):
    if type_token == "new_token":
        context.headers = {
            "Authorization": f"Bearer {context.new_token}",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
    if type_token == "doctor":
        context.headers = {
            "Authorization": f"Bearer {ACCESS_TOKEN_DOCTOR}",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
    if type_token == "admin":
        context.headers = {
            "Authorization": f"Bearer {ACCESS_TOKEN_ADMIN}",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
    elif type_token == "invalid":
        context.headers = {
            "Authorization": f"Bearer 123",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
    elif type_token == "empty":
        context.headers = {
            "Authorization": f"",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }


@given("json: create measurements")
def step_impl(context):
    context.body = generate_data_measurement()


@given("parameters: {key}={value}")
def step_impl(context, key, value):
    context.params[key] = value


@given("json: {json_data}")
def step_impl(context, json_data):
    if "current_time" in json_data:
        context.body = json_data.replace("current_time", str(get_current_time_iso()))
        context.body = json.loads(context.body)
    else:
        context.body = json.loads(json_data)


@when("method: {type_request}")
def step_impl(context, type_request):
    if type_request == 'GET':
        context.response = requests.get(url=context.url, headers=context.headers, params=context.params)
    elif type_request == 'POST':
        context.response = requests.post(url=context.url, headers=context.headers, json=context.body)
    elif type_request == 'PUT':
        context.response = requests.put(url=context.url, headers=context.headers)
    elif type_request == 'DELETE':
        context.response = requests.delete(url=context.url, headers=context.headers)
    elif type_request == 'PATCH':
        context.response = requests.patch(url=context.url, headers=context.headers, json=context.body)


@when("get: response.json()[{value}]")
def step_impl(context, value):
    if value == "measurement_id":
        context.measurement_id = context.response.json()['value'][0]['id']
    else:
        context.value_before = context.body[value]
        context.value_after = context.response.json()[value]


@then("status: {status}")
def step_impl(context, status):
    try:
        response_json = context.response.json()
    except requests.exceptions.JSONDecodeError:
        response_json = "Unable to decode JSON. Response content: " + context.response.text
    assert context.response.status_code == int(status), (
        f"Expected status code {status}, but got {context.response.status_code}"
        f"\n"
        f"Response: {response_json}"
    )


@then("check: value_before {tupy_comparison} value.after")
def check_value(context, tupy_comparison):
    examination = (f"Значение в ответе не соответствует значению в запросе."
                   f"\n"
                   f"запрос = {context.value_before} "
                   f"\n"
                   f"ответ = {context.value_after}")
    if tupy_comparison == '==':
        assert context.value_before == context.value_after, f"{examination}"
    elif tupy_comparison == '!=':
        assert context.value_before != context.value_after, f"{examination}"


@then("response {type_resp}: is not empty")
def step_impl(context, type_resp):
    if type_resp == 'json':
        assert context.response.json() != [], "Json ответа пустой."
    if type_resp == 'text':
        assert context.response.text != [], "Text ответа пустой."
