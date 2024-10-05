from behave import given, when, then
import requests
from api_method import get_token_doc
from methods import random_user_id, generate_data
import json

ACCESS_TOKEN = get_token_doc()


@given("valid user_id")
def step_impl(context):
    context.user_id = random_user_id()


@given("path: {path}")
def step_impl(context, path):
    if "user_id" in path:
        path = path.replace("user_id", str(context.user_id))
    context.url = f"http://192.168.7.221:8081{path}"


@given("API-token: {type_token}")
def step_impl(context, type_token):
    context.body = {}
    context.params = {}
    if type_token == "valid":
        context.headers = {
            "Authorization": f"Bearer {ACCESS_TOKEN}",
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
    context.body = generate_data()


@given("json: {json_data}")
def step_impl(context, json_data):
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


@when("parameters: {key}={value}")
def step_impl(context, key, value):
    context.params[key] = value


@then("status: {status}")
def step_impl(context, status):
    assert context.response.status_code == int(status), f"Expected status code {status}, but got {context.response.status_code}"


@then("answer: is not empty")
def step_impl(context):
    assert context.response.json()["value"] != [], "Response 'value' field is empty"

