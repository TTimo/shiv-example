#!/bin/bash

rm demo.pyz

pip install shiv

# Implicitly does a "pip install ." before packaging according to https://github.com/linkedin/shiv/issues/139
shiv -e demo.main -o demo.pyz .
