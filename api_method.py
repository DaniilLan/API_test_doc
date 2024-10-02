import requests


def get_token_doc():
    login = "doc@doc.com"
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


