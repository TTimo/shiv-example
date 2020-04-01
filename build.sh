#!/bin/bash

rm -rf `pipenv --venv`
pipenv install
pipenv run ./build_in_env.sh

echo "Test demo.pyz"
python3 ./demo.pyz

echo "Test demo2.pyz"
python3 ./demo2.pyz
