#!/bin/bash
set -e # -x

# Compile wheels
PYTHONS=(
    cp27-cp27m
    cp27-cp27mu
    )

for pydir in "${PYTHONS[@]}"; do
    echo "creating wheel, pydir: $pydir"
    pybin=/opt/python/$pydir/bin
    "${pybin}/pip" wheel /foo/ -w wheelhouse/

    rm -rf /foo/build
    echo
done

for whl in /wheelhouse/foo-*.whl
do
    echo
    echo
    cd `mktemp -d`
    echo $whl
    unzip -q $whl
    objdump -T foo.so | grep PyUnicode
    md5sum foo.so
done
