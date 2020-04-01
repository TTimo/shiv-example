#!/usr/bin/env python3

import setuptools

from setuptools import setup

setup(
    name="demo",
    packages=["demo"],
    install_requires=["signalslot"],
    version="0.1.0",
    entry_points={"console_scripts": ["demo = demo:main"]},
)
