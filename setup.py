# flake8: noqa
# pylint: skip-file
from setuptools import setup, find_packages

setup(name='qube_base',
      version='0.1',
      description='Qubeship base Module',
      url='http://github.com/Qubeship/qube_base_python',
      author='Hyunji Kim',
      author_email='hyunji@qubeship.io',
      license='MIT',
      packages=find_packages(),
      test_suite='nose.collector',
      tests_require=['nose'],
      zip_safe=False)
