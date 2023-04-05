#!/bin/bash -le

cd /github/workspace
for d in $@; do
    echo $SSHPASS | wc -c
    pushd $d
    sphinx-build docs docs/_out -b html
    echo Finished building, starting upload
    lftp -vvv -c "open -d sftp://docs:$SSHPASS@doku.bit-bots.de; mirror -Revvv docs/_out package/$d"
    echo Finished upload
    popd
done
