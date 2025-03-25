from behave import fixture, use_fixture
from api_method import *
from db_connect import query_delete

def before(context, type_s_f):
    if 'before.create.doctor' in type_s_f.tags:
        context.doctor_id = create_doctor()
        context.new_token = get_token_user()
    if 'before.create.patient' in type_s_f.tags:
        context.patient_id = create_patient()
    if 'before.create.patient_limits' in type_s_f.tags:
        context.patient_id = create_patient_limits()
    if 'before.create.patient_diagnoses' in type_s_f.tags:
        context.patient_id = create_patient_diagnoses(param='patient_id')
        context.diagnoses_code = create_patient_diagnoses(param='code')
    if 'before.create.measurement' in type_s_f.tags:
        context.measurement_id = create_measurement(context.patient_id)
    if 'before.create.org' in type_s_f.tags:
        context.org_id = create_org()
    if 'before.create.meeting' in type_s_f.tags:
        context.meeting_id = create_meetings(context.doctor_id)


def after(context, type_s_f):
    if 'after.delete.doctor' in type_s_f.tags:
        if hasattr(context, 'doctor_id'):
            query_delete(context.doctor_id)
    if 'after.delete.patient' in type_s_f.tags:
        if hasattr(context, 'patient_id'):
            query_delete(context.patient_id)
    if 'after.delete.patient_limits' in type_s_f.tags:
        if hasattr(context, 'patient_id'):
            delete_patient(context.patient_id)
    if 'after.delete.patient_diagnoses' in type_s_f.tags:
        if hasattr(context, 'patient_id'):
            delete_patient(context.patient_id)
    if 'after.delete.measurement' in type_s_f.tags:
        if hasattr(context, 'measurement_id'):
            delete_measurement(context.patient_id, context.measurement_id)
    if 'after.delete.org' in type_s_f.tags:
        if hasattr(context, 'org_id'):
            delete_org(context.org_id)
    if 'after.delete.meeting' in type_s_f.tags:
        if hasattr(context, 'meeting_id'):
            delete_meeting(context.meeting_id)


def before_scenario(context, scenario):
    before(context, scenario)


def after_scenario(context, scenario):
    after(context, scenario)


def before_feature(context, feature):
    before(context, feature)


def after_feature(context, feature):
    after(context, feature)












