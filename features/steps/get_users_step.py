from behave import given, when, then
import requests
from api_method import get_token_doc

ACCESS_TOKEN = get_token_doc()


@given("Отправка (валидного|невалидного|пустого) API token")
def step_impl(context, method):
    if method == "валидного":
        context.headers = {
            "Authorization": f"Bearer {ACCESS_TOKEN}",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
        context.url = "http://192.168.7.221:8081/api/v4/Users"
    elif method == "невалидного":
        context.headers = {
            "Authorization": f"Bearer 123",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
        context.url = "http://192.168.7.221:8081/api/v4/Users"
    elif method == "пустого":
        context.headers = {
            "Authorization": f"",
            'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
        }
        context.url = "http://192.168.7.221:8081/api/v4/Users"



@when(r"Отправка (GET|POST|PUT|DELETE) запроса")
def step_impl(context, method):
    if 'GET' == method:
        context.response = requests.get(url=context.url, headers=context.headers)
    elif 'POST' == method:
        context.response = requests.post(url=context.url, headers=context.headers)
    elif 'PUT' == method:
        context.response = requests.put(url=context.url, headers=context.headers)
    elif 'DELETE' == method:
        context.response = requests.delete(url=context.url, headers=context.headers)


@when("I send a GET request to the API with count filter")
def step_impl(context):
    context.response = requests.get(url=f"{context.url}?$count=true", headers=context.headers)


@when("I send a GET request to the API with top 10 filter")
def step_impl(context):
    context.response = requests.get(url=f"{context.url}?$top=10", headers=context.headers)


@then("the response status code should be 200")
def step_impl(context):
    assert context.response.status_code == 200, f"Expected status code 200, but got {context.response.status_code}"


@then("the response should not be empty")
def step_impl(context):
    assert context.response.json()["value"] != [], "Response 'value' field is empty"
    print(context.response.json())

