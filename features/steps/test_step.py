from behave import given, when, then
import requests
from api_method import get_token_doc
from methods import get_random_user_id

ACCESS_TOKEN = get_token_doc()


@given("path {path}")
def step_impl(context, path):
    context.url = f"http://192.168.7.221:8081{path}"


@given("{type_token} API token")
def step_impl(context, type_token):
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


@when("method {type_request}")
def step_impl(context, type_request):
    if type_request == 'GET':
        context.response = requests.get(url=context.url, headers=context.headers)
    elif type_request == 'POST':
        context.response = requests.post(url=context.url, headers=context.headers)
    elif type_request == 'PUT':
        context.response = requests.put(url=context.url, headers=context.headers)
    elif type_request == 'DELETE':
        context.response = requests.delete(url=context.url, headers=context.headers)


@when("parameter count=true in GET request")
def step_impl(context):
    context.response = requests.get(url=f"{context.url}?$count=true", headers=context.headers)


@when("parameter top={quantity} in GET request")
def step_impl(context, quantity):
    context.response = requests.get(url=f"{context.url}?$top={quantity}", headers=context.headers)


@then("status {status}")
def step_impl(context, status):
    assert context.response.status_code == int(status), f"Expected status code {status}, but got {context.response.status_code}"


@then("answer is not empty")
def step_impl(context):
    assert context.response.json()["value"] != [], "Response 'value' field is empty"

