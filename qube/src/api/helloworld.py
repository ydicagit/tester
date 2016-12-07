#!/usr/bin/python
"""
Add docstring here
"""
from flask.ext.restful_swagger_2 import Resource, swagger
from flask_restful import reqparse
from qube.src.api.swagger_models.parameters \
    import header_ex, path_ex, query_ex
from qube.src.api.swagger_models.response_messages \
    import response_msgs
from qube.src.commons.log import Log as LOG


params = [header_ex, path_ex, query_ex]


class HelloWorld(Resource):
    @swagger.doc(
        {
            'tags': ['Hello World'],
            'description': 'hello world get operation',
            'parameters': params,
            'responses': response_msgs
        }
    )
    def get(self, name=None):
        LOG.debug("hello world")

        parser = reqparse.RequestParser()
        parser.add_argument('sth')
        args = parser.parse_args()
        name = name if name is not None else 'test'
        sth = args['sth'] if args['sth'] is not None else 'hello world'

        return {name: sth}
