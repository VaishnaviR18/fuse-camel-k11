#!/bin/sh
set -e

echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/cmd.VersionVariant=RedHat" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/install.KamelCLIDownloadName=redhat-kamel-cli" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X 'github.com/apache/camel-k/pkg/install.KamelCLIDownloadDisplayName=kamel - Red Hat Integration - Camel K - Command Line Interface'" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X 'github.com/apache/camel-k/pkg/install.KamelCLIDownloadDescription=CLI for Red Hat Integration - Camel K. The \\\`kamel\\\` binary can be used to both configure the cluster and run integrations. Once you have downloaded the \\\`kamel\\\` binary, log into the cluster using the \\\`oc\\\` client tool and start using the \\\`kamel\\\` CLI.'" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/install.KamelCLIDownloadURLTemplate=https://mirror.openshift.com/pub/openshift-v4/clients/camel-k/%s/camel-k-client-%s-%s-64bit.tar.gz" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/util/olm.DefaultOperatorName=red-hat-camel-k-operator" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/util/olm.DefaultPackage=red-hat-camel-k" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/util/olm.DefaultChannel=techpreview" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/util/olm.DefaultSource=redhat-operators" >> /camel-k-$CAMEL_K_TAG/script/Makefile && \
echo "GOLDFLAGS += -X github.com/apache/camel-k/pkg/util/maven.DefaultMavenRepositories=https://maven.repository.redhat.com/ga@id=redhat.ga,https://maven.repository.redhat.com/earlyaccess/all@id=redhat.ea,https://repo.maven.apache.org/maven2@id=central" >> /camel-k-$CAMEL_K_TAG/script/Makefile
