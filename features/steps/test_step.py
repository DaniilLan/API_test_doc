from behave import given, when, then
import requests
from api_method import get_token_doc

ACCESS_TOKEN = get_token_doc()


@given("Отправка: {type_token} API token")
def step_impl(context, type_token):
    context.url = "http://192.168.7.221:8081/api/v4/Users"
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


@when("Отправка: method {type_request}")
def step_impl(context, type_request):
    if type_request == 'GET':
        context.response = requests.get(url=context.url, headers=context.headers)
    elif type_request == 'POST':
        context.response = requests.post(url=context.url, headers=context.headers)
    elif type_request == 'PUT':
        context.response = requests.put(url=context.url, headers=context.headers)
    elif type_request == 'DELETE':
        context.response = requests.delete(url=context.url, headers=context.headers)


@when("Добавить: parameter count=true in GET request")
def step_impl(context):
    context.response = requests.get(url=f"{context.url}?$count=true", headers=context.headers)


@when("Добавить: parameter top={quantity} in GET request")
def step_impl(context, quantity):
    context.response = requests.get(url=f"{context.url}?$top={quantity}", headers=context.headers)


@then("Ожидать: status {status}")
def step_impl(context, status):
    assert context.response.status_code == int(status), f"Expected status code {status}, but got {context.response.status_code}"


@then("Ожидать: answer is not empty")
def step_impl(context):
    assert context.response.json()["value"] != [], "Response 'value' field is empty"
    print(context.response.json())

