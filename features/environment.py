from behave import fixture, use_fixture
from api_method import *


def before(context, type_s_f):
    if 'before.create.doctor' in type_s_f.tags:
        context.doctor_id = create_doctor()
        return context.doctor_id
    elif 'before.create.patient' in type_s_f.tags:
        context.patient_id = create_patient()
        return context.patient_id
    elif 'before.create.measurement' in type_s_f.tags:
        context.measurement_id = create_measurement(context.patient_id)
        return context.measurement_id


def after(context, type_s_f):
    if 'after.delete.doctor' in type_s_f.tags:
        if hasattr(context, 'doctor_id'):
            delete_user(context.doctor_id)
    elif 'after.delete.patient' in type_s_f.tags:
        if hasattr(context, 'patient_id'):
            delete_patient(context.patient_id)
    elif 'after.delete_measurement' in type_s_f.tags:
        if hasattr(context, 'measurement_id'):
            delete_measurement(context.measurement_id)


def before_scenario(context, scenario):
    before(context, scenario)


def after_scenario(context, scenario):
    after(context, scenario)


def before_feature(context, feature):
    before(context, feature)


def after_feature(context, feature):
    after(context, feature)












