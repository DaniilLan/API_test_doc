import random


def get_random_user_id(min_id=1, max_id=1000):
    return random.randint(min_id, max_id)