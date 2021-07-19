/bin/bash
-lc
mkdir -p /go/src/github.com/apache/ \
    && mv /camel-k-$CAMEL_K_TAG /go/src/github.com/apache/camel-k \
    && cd /go/src/github.com/apache/camel-k \
    && make codegen set-version VERSION=${CAMEL_K_VERSION} \
        RUNTIME_VERSION=${CAMEL_K_RUNTIME_VERSION} \
        BASE_IMAGE=registry.access.redhat.com/ubi8/openjdk-11:1.3 \
        IMAGE_NAME=${IMAGE_NAME} \
        KAMELET_CATALOG_REPO=git@github.com:openshift-integration/kamelet-catalog.git \
    && ./script/embed_resources.sh deploy \
    && make build-kamel