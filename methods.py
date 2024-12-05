import json
import random
import string
from russian_names import RussianNames
from datetime import datetime, timedelta, timezone


def generate_data_measurement():
    source_to_types = {
        "thermometer": {
            "type": "temperature",
            "min": 32,
            "max": 42
        },
        "manual": {
            "types": {
                "temperature": {"min": 32, "max": 42},
                "weight": {"min": 0, "max": 500},
                "pulse": {"min": 40, "max": 200}
            }
        },
        "glucosemeter": {
            "type": "glucose",
            "min": 0.6,
            "max": 33.3
        },
        "scales": {
            "type": "weight",
            "min": 0,
            "max": 500
        },
        "pulseoxymeter": {
            "type": "spo2",
            "min": 0,
            "max": 100
        },
        "smartwatch": {
            "types": {
                "pulse": {"min": 40, "max": 200},
                "spo2": {"min": 0, "max": 100}
            }
        },
        "tonometer": {
            "type": "pulse",
            "min": 40,
            "max": 200
        }
    }

    source = random.choice(list(source_to_types.keys()))
    type_info = source_to_types[source]

    if "types" in type_info:
        measurement_type = random.choice(list(type_info["types"].keys()))
        min_value = type_info["types"][measurement_type]["min"]
        max_value = type_info["types"][measurement_type]["max"]
    else:
        measurement_type = type_info["type"]
        min_value = type_info["min"]
        max_value = type_info["max"]

    value = round(random.uniform(min_value, max_value), 1)
    data = [{
        "created": "2024-03-07T10:43:00+04:00",
        "source": source,
        "type": measurement_type,
        "value": value,
        "parameters": [{"type": "app.comment", "value": "qweqwe"}]
    }]
    return data

def get_random_value():
    return random.randint(40, 140)


def get_current_time_iso(hours_to_add=0):
    current_time = datetime.now(timezone.utc) + timedelta(hours=hours_to_add)
    milliseconds = round(current_time.microsecond / 1000)
    current_time_iso = current_time.strftime('%Y-%m-%dT%H:%M:%S.') + f'{milliseconds:02d}Z'
    return current_time_iso.replace("0Z", 'Z')


def random_phone():
    """Создание нмоера-телефона из 10 рандомных цифр без +7 (пример - 9276013854)"""
    numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    random.shuffle(numbers)
    numbers_str = ''
    for i in numbers:
        numbers_str += str(i)
    return numbers_str


def random_fio(value='FIO'):
    """Создание рандомого ФИО

    Указать в параметре нужное значение ФИО.

    'FIO' - верентся ФИО *По умолчанию

    'F' - вернется фамилия

    'I' - вернется имя

    'O' - вернется отчество
    """
    rn = RussianNames(count=1, name_reduction=False, patronymic_reduction=False, surname_reduction=False)
    fio = str(rn.get_batch()[0])
    if value == 'FIO':
        fio = fio.split()
        fio = fio[2]+' '+fio[0]+' '+fio[1]
        fio = str(fio)
    elif value == 'I':
        firstname = fio.split()
        fio = str(firstname[0])
    elif value == 'F':
        lastname = fio.split()
        fio = str(lastname[2])
    elif value == "O":
        patronymic = fio.split()
        fio = str(patronymic[1])
    return fio


def random_mail():
    """Создание рандомного mail"""
    mail = ''.join(random.choice(string.ascii_letters) for _ in range(8)) + str(random.randint(1, 1000)) + "@gmail.com"
    return mail

