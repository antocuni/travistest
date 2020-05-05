import sys
import os
from setuptools import setup, find_packages, Extension
from setuptools.command.sdist import sdist
from Cython.Build import cythonize

setup(name="foo",
      author='Antonio Cuni',
      author_email='anto.cuni@gmail.com',
      version='0.0.1',
      ext_modules=cythonize('foo.pyx'))
