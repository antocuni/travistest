import sys
import os
from setuptools import setup, Extension

setup(name="foo",
      author='Antonio Cuni',
      author_email='anto.cuni@gmail.com',
      version='0.0.1',
      ext_modules=[
          Extension('foo', ['foo.c']),
          ]
      )
