#!/usr/bin/python
"""
Add docstring here
"""
from logging.config import fileConfig
import optparse
import os
from flask import Flask
from flask_restful import Api
from flask_restful_swagger import swagger
from pkg_resources import resource_filename
from qube_base.src.api.helloworld import HelloWorld
from qube_base.src.commons.log import Log as LOG


logging_config = resource_filename(
    'qube_base.src.resources', 'logging_config.ini')
fileConfig(logging_config)

app = Flask(__name__)
DEFAULT_HOST = os.environ['DEFAULT_LISTENER_HOST']
DEFAULT_PORT = os.environ['DEFAULT_LISTENER_PORT']
api = swagger.docs(Api(app), apiVersion='0.1',
                   produces=["application/json", "text/html"],
                   api_spec_url='/api/spec', description='Hello World')

api.add_resource(HelloWorld, '/')


def create_parser():
    """create parser
    """
    parser = optparse.OptionParser()
    parser.add_option("-H", "--host",
                      help="Hostname of the Flask app " +
                      "[default %s]" % DEFAULT_HOST,
                      default=DEFAULT_HOST)
    parser.add_option("-P", "--port",
                      help="Port for the Flask app " +
                      "[default %s]" % DEFAULT_PORT,
                      default=DEFAULT_PORT)

    # Two options useful for debugging purposes, but
    # a bit dangerous so not exposed in the help message.
    parser.add_option("-d", "--debug",
                      action="store_true", dest="debug",
                      help=optparse.SUPPRESS_HELP)
    return parser


def main():
    """ main
    """
    parser = create_parser()
    options, _ = parser.parse_args()
    app.secret_key = os.urandom(24)
    LOG.info("starting app...")
    app.run(debug=options.debug,
            host=options.host,
            port=int(options.port))


if __name__ == '__main__':
    main()
