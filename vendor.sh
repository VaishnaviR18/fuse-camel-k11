docker run --rm -v $PWD/camel-k:/usr/src/camel-k:z \
           -w /usr/src/camel-k/cmd golang:1.13.6 \
           /bin/bash -c "go mod vendor"

    pushd camel-k
    tar zcf vendor.tar.gz vendor
    popd

    mv camel-k/vendor.tar.gz .