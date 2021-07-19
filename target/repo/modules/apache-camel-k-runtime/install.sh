#!/bin/sh

mkdir -p /tmp/artifacts/m2 \
&& cd /tmp/artifacts/m2 \
&& unzip -q /tmp/apache-camel-k-runtime-$CAMEL_K_RUNTIME_VERSION-m2.zip \
&& chgrp 185 /tmp/artifacts/ \
&& find /tmp/artifacts -type d -exec chmod 777 {} \;