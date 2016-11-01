#!/usr/bin/python
"""
Add docstring here
"""
from flask_restful import Resource
from flask_restful_swagger import swagger
from qube.src.commons.log import Log as LOG


@swagger.model
class HelloWorldItem(object):
    def __init__(self, arg1):
        pass


class HelloWorld(Resource):
    "HelloWorld resource"
    @swagger.operation(notes='hello world get operation',
                       responseClass=HelloWorldItem.__name__,
                       nickname='Hello World',
                       parameters=[
                           {
                               "name": "body",
                               "description": "Hello World",
                               "required": True,
                               "allowMultiple": False,
                               "paramType": "body",
                               "dataType": HelloWorldItem.__name__
                           }
                       ],
                       responseMessages=[
                           {
                               "code": 200,
                               "message": "OK"
                           },
                           {
                               "code": 400,
                               "message": "Bad request"
                           },
                           {
                               "code": 401,
                               "message": "Unauthorized"
                           },
                           {
                               "code": 500,
                               "message": "Internal server error"
                           }
                       ])
    def get(self):
        LOG.debug("hello world")
        return {'hello': 'world'}
