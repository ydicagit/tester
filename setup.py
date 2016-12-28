# flake8: noqa
# pylint: skip-file
from setuptools import setup, find_packages

setup(name='tester',
      version='0.1',
      description='tester',
      url='http://github.com/Qubeship/tester',
      author='Hyunji Kim',
      author_email='hyunji@qubeship.io',
      license='MIT',
      packages=find_packages(),
      package_data={'': ['*.ini', '*.json','*.properties','*.xml','*.yaml','*.yml','*.config']},
      test_suite='nose.collector',
      tests_require=['nose'],
      zip_safe=False)
