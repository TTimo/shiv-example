#!/bin/bash

rm -rf `pipenv --venv`
pipenv install
pipenv run ./build_demo_in_env.sh

echo "Test demo.pyz"
python3 ./demo.pyz

# --------------------------------

rm -rf `pipenv --venv`
pipenv install
pipenv run ./build_demo2_in_env.sh

echo "Test demo2.pyz"
python3 ./demo2.pyz
