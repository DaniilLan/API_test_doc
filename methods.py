import json
import random
import string
from russian_names import RussianNames
from datetime import datetime, timedelta, timezone


def random_user_id():
    list_id = [5, 1, 1213, 72, 108, 1214, 165, 164, 159, 166, 167, 172, 168, 170, 169, 171, 176, 1216, 1217, 1218, 1219,
               1220, 1221, 1222, 1223, 1224, 1225, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199,
               200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 211, 212, 210, 213, 214, 215, 216, 247, 218, 219, 220,
               221, 223, 224, 225, 226, 227, 228, 229, 230, 231, 233, 234, 235, 236, 237, 238, 239, 240, 242, 243, 244,
               245, 246, 248, 249, 251, 252, 253, 254, 256, 257, 258, 259, 260, 261, 262, 263, 264, 266, 267, 268, 269,
               270, 271, 272, 273, 275, 276, 277, 278, 279, 280, 281, 282, 284, 285, 286, 287, 289, 290, 291, 292, 293,
               294, 295, 296, 297, 299, 300, 301, 302, 303, 304, 305, 306, 308, 309, 310, 311, 312, 313, 314, 315, 317,
               318, 319, 320, 322, 323, 324, 325, 326, 327, 328, 329, 330, 332, 333, 334, 335, 336, 337, 338, 339, 341,
               342, 343, 344, 345, 346, 347, 348, 350, 351, 352, 353, 355, 356, 357, 358, 359, 360, 361, 362, 363, 365,
               366, 367, 368, 369, 370, 371, 372, 374, 375, 376, 377, 378, 379, 380, 381, 383, 384, 385, 386, 388, 389,
               390, 391, 392, 393, 394, 395, 396, 398, 399, 400, 401, 402, 403, 404, 405, 407, 408, 409, 410, 411, 412,
               413, 414, 416, 417, 418, 419, 421, 422, 423, 424, 425, 426, 427, 428, 429, 431, 432, 433, 434, 435, 436,
               437, 438, 440, 441, 442, 443, 444, 445, 446, 447, 449, 450, 451, 452, 454, 455, 456, 457, 458, 459, 460,
               461, 462, 464, 465, 466, 467, 468, 469, 470, 471, 473, 474, 475, 476, 477, 478, 479, 480, 1273, 482, 483,
               484, 485, 487, 488, 489, 490, 491, 492, 493, 494, 495, 497, 498, 499, 500, 501, 502, 503, 504, 506, 507,
               508, 509, 510, 511, 512, 513, 515, 516, 517, 518, 520, 521, 522, 523, 524, 525, 526, 527, 528, 530, 531,
               532, 533, 534, 535, 536, 537, 539, 540, 541, 542, 543, 544, 545, 546, 548, 549, 550, 551, 553, 554, 555,
               556, 557, 558, 559, 560, 561, 563, 564, 565, 566, 567, 568, 569, 570, 572, 573, 574, 575, 576, 577, 578,
               579, 581, 582, 583, 584, 586, 587, 588, 589, 590, 591, 592, 593, 594, 596, 597, 598, 599, 600, 601, 602,
               603, 605, 606, 607, 608, 609, 610, 611, 612, 614, 615, 616, 617, 619, 620, 621, 622, 623, 624, 625, 626]
    return random.choice(list_id)


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
print(json.dumps(generate_data_measurement()))

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

