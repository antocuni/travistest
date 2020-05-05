#!/bin/bash
set -e -x

# Compile wheels
PYTHONS=(
    cp27-cp27m
    cp27-cp27mu
    )

for pydir in "${PYTHONS[@]}"; do
    pybin=/opt/python/$pydir/bin
    "${pybin}/pip" install 'cython>=0.25'
    "${pybin}/pip" wheel /foo/ -w wheelhouse/

    # create the sdist if it does not exist yet
    if [[ ! -d /foo/dist ]]
    then
        (cd /foo && "${pybin}/python" setup.py sdist)
    fi
done

echo
echo "objdump of foo.so"
pushd /tmp/
unzip /wheelhouse/foo-*-cp27-cp27mu-linux_x86_64.whl
objdump -T foo.so | grep PyUnicode
echo
md5sum foo.so
popd
