# setup.py
from setuptools import setup
from Cython.Build import cythonize

setup(
    name="DataBase",
    ext_modules=cythonize("DataBase.py"),
)
