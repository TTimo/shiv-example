#!/bin/bash

rm demo2.pyz

pip install shiv

# Installs demo, dependencies etc.
pip install .

# This picks up more than just demo and signalslot modules (shiv, setuptools, pip etc.)
shiv -e demo.main -o demo2.pyz --site-packages `pipenv --venv`/lib/python3.8/site-packages
