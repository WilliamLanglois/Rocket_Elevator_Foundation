import json
from student import SchoolDB

def setup_module(module):
    print('-----setup-----')
    global db
    db = SchoolDB()
    db.connect('data.json')

def teardown_module(module):
    print('-----teardown-----')
    db.close()

def test_get_data():
    senpai = db.get_student('Senpai')
    assert senpai['Class'] == "32"
    assert senpai['Name'] == "Senpai"

def test_get_full_name():
    full_name = db.get_student('Senpai')
    assert full_name['Name'] + ' ' + full_name['Info'] == 'Senpai An average student.'
    