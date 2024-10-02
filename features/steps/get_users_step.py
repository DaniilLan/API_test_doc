from behave import given, when, then
import requests
from api_method import get_token_doc

ACCESS_TOKEN = get_token_doc()


@given("I have a valid API token")
def step_impl(context):
    context.headers = {
        "Authorization": f"Bearer {ACCESS_TOKEN}",
        'Content-Type': 'application/json; odata.metadata=minimal; odata.streaming=true;'
    }
    context.url = "http://192.168.7.221:8081/api/v4/Users"


@when("I send a GET request to the API")
def step_impl(context):
    context.response = requests.get(url=context.url, headers=context.headers)


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

