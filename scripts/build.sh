#!/bin/bash
pip install tox wheel
pip list
tox
python setup.py bdist_wheel