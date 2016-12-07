#!/usr/bin/python
"""
Add docstring here
"""
import os
import unittest


class TestHelloWorld(unittest.TestCase):
    def setUp(self):
        os.environ['DEFAULT_LISTENER_HOST'] = '0.0.0.0'
        os.environ['DEFAULT_LISTENER_PORT'] = '5000'
        os.environ['DEBUG'] = 'Yes'
        from qube.src.api.app import app as qube
        self.client = qube.test_client()

    def test_hello_world(self):
        """Hello World test"""
        rv = self.client.get('/test?sth=hello')
        assert b'hello' in rv.data


if __name__ == '__main__':
    unittest.main()
