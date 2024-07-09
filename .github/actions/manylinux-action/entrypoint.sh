#!/bin/sh -l

package="$1"
graalpy_version="$2"

set -x

mkdir graalpy
cd graalpy
curl -sfLO "https://github.com/oracle/graalpython/releases/download/graal-${graalpy_version}/graalpy-${graalpy_version}-linux-amd64.tar.gz" || \
    curl -sfLO https://github.com/graalvm/graal-languages-ea-builds/releases/download/graalpy-${graalpy_version}/graalpy-${graalpy_version}-linux-amd64.tar.gz
tar --strip-components=1 -xzf graalpy-${graalpy_version}-linux-amd64.tar.gz
cd ..
graalpy/bin/graalpy -s -m ensurepip
graalpy/bin/graalpy -m pip install wheel
export PATH="$(pwd)/graalpy/bin:${PATH}"

graalpy/bin/graalpy -m pip install "$package"
cache_dir=`graalpy/bin/graalpy -m pip cache dir`
mkdir -p /github/workspace/wheelhouse
find $cache_dir -name "*.whl" -exec auditwheel repair -w /github/workspace/wheelhouse "{}" ";"
