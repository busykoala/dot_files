import os


def Settings( **kwargs ):
    PATH = os.path.dirname(os.path.abspath(__file__))
    return {
        'interpreter_path': PATH + '/venv/bin/python',
        'sys_path': [
            PATH + '/venv/lib/python3.7'
        ]
    }
