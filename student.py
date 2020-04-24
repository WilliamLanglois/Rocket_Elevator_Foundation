import json

class SchoolDB:
    def __init__ (self):
        self.__data = None

    def connect(self, data_file):
        with open (data_file) as json_file:
            self.__data = json.load(json_file)
    
    def get_student (self, name):
        for student in self.__data['students']:
            if student['Name'] == name:
                return student

    def get_full_name(self, name):
        for student in self.__data['students']:
            if student['Name'] == name:
                return '{} {}'.format(student.Name, student.Info)

    def close(self):
        pass