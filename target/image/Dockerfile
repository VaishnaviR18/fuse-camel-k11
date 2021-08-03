
# This is a Dockerfile for the integration-tech-preview/camel-k-rhel8-operator:1.0 image.

## START builder image builder:1.3.0
## \
    FROM registry-proxy.engineering.redhat.com/rh-osbs/openshift-golang-builder:v1.13.4-3.el8 AS builder
    USER root

###### START module 'environ:1.0'
###### \
        # Set 'environ' module defined environment variables
        ENV \
            CAMEL_K_RUNTIME_VERSION="1.6.0.fuse-jdk11-800004-redhat-00001" \
            CAMEL_K_TAG="camel-k-1.3.0.fuse-jdk11-800003" \
            CAMEL_K_VERSION="1.3.0" \
            CAMEL_QUARKUS_VERSION="1.5.0.fuse-jdk11-800005-redhat-00001" \
            CAMEL_VERSION="3.7.0.fuse-jdk11-800009-redhat-00001" \
            GOPATH="/go" \
            IMAGE_NAME="registry.redhat.io/integration-tech-preview/camel-k-rhel8-operator" \
            MAVEN_VERSION="3.6.3" 
###### /
###### END module 'environ:1.0'

###### START module 'camel-k:1.0'
###### \
        # Copy 'camel-k' module general artifacts to '//' destination
        COPY \
            camel-k-camel-k-1.3.0.fuse-jdk11-800003.tar.gz \
            //
        # Copy 'camel-k' module content
        COPY modules/camel-k /tmp/scripts/camel-k
        # Custom scripts from 'camel-k' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/camel-k/install.sh" ]
###### /
###### END module 'camel-k:1.0'

###### START module 'vendor:1.0'
###### \
        # Copy 'vendor' module general artifacts to '//' destination
        COPY \
            vendor.tar.gz \
            //
        # Copy 'vendor' module content
        COPY modules/vendor /tmp/scripts/vendor
        # Switch to 'root' user to install 'vendor' module defined packages
        USER root
        # Install packages defined in the 'vendor' module
        RUN yum --setopt=tsflags=nodocs install -y unzip tar rsync shadow-utils \
            && rpm -q unzip tar rsync shadow-utils
        # Custom scripts from 'vendor' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/vendor/install.sh" ]
###### /
###### END module 'vendor:1.0'

###### START module 'apache-maven:1.0'
###### \
        # Copy 'apache-maven' module general artifacts to '//' destination
        COPY \
            apache-maven-3.6.3-bin.tar.gz \
            //
        # Copy 'apache-maven' module content
        COPY modules/apache-maven /tmp/scripts/apache-maven
        # Switch to 'root' user to install 'apache-maven' module defined packages
        USER root
        # Install packages defined in the 'apache-maven' module
        RUN yum --setopt=tsflags=nodocs install -y unzip tar rsync shadow-utils \
            && rpm -q unzip tar rsync shadow-utils
        # Custom scripts from 'apache-maven' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/apache-maven/install.sh" ]
###### /
###### END module 'apache-maven:1.0'

###### START module 'camel-catalog:1.0'
###### \
        # Copy 'camel-catalog' module general artifacts to '//' destination
        COPY \
            camel-catalog-1.6.0.fuse-jdk11-800004-redhat-00001.yaml \
            //
        # Copy 'camel-catalog' module content
        COPY modules/camel-catalog /tmp/scripts/camel-catalog
        # Custom scripts from 'camel-catalog' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/camel-catalog/backward_compatibility.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/camel-catalog/install.sh" ]
###### /
###### END module 'camel-catalog:1.0'

###### START module 'settings:1.0'
###### \
        # Copy 'settings' module content
        COPY modules/settings /tmp/scripts/settings
        # Custom scripts from 'settings' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/settings/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/settings/backward_compatibility.sh" ]
###### /
###### END module 'settings:1.0'

###### START module 'makefile:1.0'
###### \
        # Copy 'makefile' module content
        COPY modules/makefile /tmp/scripts/makefile
        # Custom scripts from 'makefile' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/makefile/install.sh" ]
###### /
###### END module 'makefile:1.0'

###### START module 'build-camel-k:1.0'
###### \
        # Copy 'build-camel-k' module content
        COPY modules/build-camel-k /tmp/scripts/build-camel-k
        # Custom scripts from 'build-camel-k' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/build-camel-k/build.sh" ]
###### /
###### END module 'build-camel-k:1.0'

###### START module 'licenses:1.0'
###### \
        # Copy 'licenses' module content
        COPY modules/licenses /tmp/scripts/licenses
        # Custom scripts from 'licenses' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/licenses/configure.sh" ]
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/licenses/license.sh" ]
###### /
###### END module 'licenses:1.0'

###### START image 'builder:1.3.0'
###### \
###### /
###### END image 'builder:1.3.0'


## /
## END builder image

## START target image integration-tech-preview/camel-k-rhel8-operator:1.0
## \
    FROM registry-proxy.engineering.redhat.com/rh-osbs/openjdk-openjdk-11-rhel8:1.2


    USER root

###### START module 'environ:1.0'
###### \
        # Set 'environ' module defined environment variables
        ENV \
            CAMEL_K_RUNTIME_VERSION="1.6.0.fuse-jdk11-800004-redhat-00001" \
            CAMEL_K_TAG="camel-k-1.3.0.fuse-jdk11-800003" \
            CAMEL_K_VERSION="1.3.0" \
            CAMEL_QUARKUS_VERSION="1.5.0.fuse-jdk11-800005-redhat-00001" \
            CAMEL_VERSION="3.7.0.fuse-jdk11-800009-redhat-00001" \
            GOPATH="/go" \
            IMAGE_NAME="registry.redhat.io/integration-tech-preview/camel-k-rhel8-operator" \
            MAVEN_VERSION="3.6.3" 
###### /
###### END module 'environ:1.0'

###### START module 'apache-camel-k-runtime:1.0'
###### \
        # Copy 'apache-camel-k-runtime' module general artifacts to '/tmp/' destination
        COPY \
            apache-camel-k-runtime-1.6.0.fuse-jdk11-800004-redhat-00001-m2.zip \
            /tmp/
        # Copy 'apache-camel-k-runtime' module content
        COPY modules/apache-camel-k-runtime /tmp/scripts/apache-camel-k-runtime
        # Custom scripts from 'apache-camel-k-runtime' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/apache-camel-k-runtime/install.sh" ]
###### /
###### END module 'apache-camel-k-runtime:1.0'

###### START module 'remove-artifact:1.0'
###### \
        # Copy 'remove-artifact' module content
        COPY modules/remove-artifact /tmp/scripts/remove-artifact
        # Custom scripts from 'remove-artifact' module
        USER root
        RUN [ "sh", "-x", "/tmp/scripts/remove-artifact/run.sh" ]
###### /
###### END module 'remove-artifact:1.0'

###### START image 'integration-tech-preview/camel-k-rhel8-operator:1.0'
###### \
        # Copy 'integration-tech-preview/camel-k-rhel8-operator' image stage artifacts
        COPY --from=builder /opt/apache-maven-3.6.3 /opt/apache-maven-3.6.3/apache-maven-3.6.3
        COPY --from=builder /go/src/github.com/apache/camel-k/kamel /usr/local/bin/kamel
        COPY --from=builder /go/src/github.com/apache/camel-k/licenses /root/licenses/fuse-camel-k/licenses
        # Set 'integration-tech-preview/camel-k-rhel8-operator' image defined labels
        LABEL \
            com.redhat.component="fuse-camel-k-operator-container"  \
            description="Red Hat Integration - Camel K is a lightweight integration platform, born on Kubernetes, with serverless superpowers."  \
            fuse.camel-k.runtime.version="1.6.0.fuse-jdk11-800004-redhat-00001"  \
            fuse.camel-k.tag="camel-k-1.3.0.fuse-jdk11-800003"  \
            fuse.camel.quarkus.version="1.5.0.fuse-jdk11-800005-redhat-00001"  \
            fuse.camel.version="3.7.0.fuse-jdk11-800009-redhat-00001"  \
            io.cekit.version="3.11.0"  \
            io.k8s.display-name="Red Hat Integration - Camel K"  \
            io.openshift.tags="fuse,integration,camel"  \
            maintainer="Otavio Piske <opiske@redhat.com>"  \
            summary="Red Hat Integration - Camel K is a lightweight integration platform, born on Kubernetes, with serverless superpowers." 
###### /
###### END image 'integration-tech-preview/camel-k-rhel8-operator:1.0'



    # Switch to 'root' user and remove artifacts and modules
    USER root
    RUN [ ! -d /tmp/scripts ] || rm -rf /tmp/scripts
    RUN [ ! -d /tmp/artifacts ] || rm -rf /tmp/artifacts
    # Define the user
    USER root
    # Define run cmd
    CMD ["kamel", "operator"]
## /
## END target image