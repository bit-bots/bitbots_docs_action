#!/bin/bash -le

cd /github/workspace
for d in $@; do
    pushd $d
    sphinx-build docs docs/_out -b html
    lftp -c "open sftp://docs:$SSHPASS@doku.bit-bots.de; mirror -Re docs/_out package/$d"
    popd
done
