#!/bin/bash

rm demo.pyz

pip install shiv

# This would install an egg, I prefer a traditional install
#python setup.py install

# Do not use 'python setup.py install', that would install an egg, which shiv seems to have trouble with
pip install .

# Fails with "No matching distribution found for demo"
#shiv -e demo.main -o demo.pyz demo

# Have to either use --site-packages argument or a non empty pip args list, so let's throw one of the dependencies at it
shiv -e demo.main -o demo.pyz signalslot

# Stuff the demo module in the .pyz by hand:
pyz_path=`realpath demo.pyz`
pushd `pipenv --venv`/lib/python3.8
zip -r ${pyz_path} site-packages/demo/ site-packages/demo-0.1.0.dist-info/
popd

# But that's not enough! Rezip it clean, after which it will work
# Python is sensitive to archive members order??
rm -rf tmp
pushd tmp
unzip ${pyz_path}
rm ${pyz_path}
zip -r ${pyz_path} *

# This picks up more than just demo and signalslot modules (shiv, setuptools, pip etc.), but at least the resulting demo2.pyz works without futzing
shiv -e demo.main -o demo2.pyz --site-packages `pipenv --venv`/lib/python3.8/site-packages
