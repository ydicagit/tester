# flake8: noqa
# pylint: skip-file
from setuptools import setup

setup(name='qube_cli',
      version='0.1',
      description='Qubeship CLI Module',
      url='http://github.com/Qubeship/qube_cli',
      author='Hyunji Kim',
      author_email='hyunji@qubeship.io',
      license='MIT',
      packages=['qube_cli.src', 'qube_cli.tests'],
      test_suite='nose.collector',
      tests_require=['nose'],
      zip_safe=False)
