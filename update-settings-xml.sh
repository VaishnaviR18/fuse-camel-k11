#!/bin/bash

set -o pipefail
set -eu

a=`wc -l < settings.xml`
result=`expr $a - 1`
echo "$result"

sed -i "$result i\\		<profile>\\" settings.xml
sed -i "`expr $result + 1`i\\			<id>$1</id>\\" settings.xml
sed -i "`expr $result + 2`i\\			<properties>\\" settings.xml
sed -i "`expr $result + 3`i\\				<profile.name>Fuse-$1</profile.name>\\" settings.xml
sed -i "`expr $result + 4`i\\		   		<fuse.version>$1</fuse.version>\\" settings.xml
sed -i "`expr $result + 5`i\\				<fuse.image.version>$2</fuse.image.version>\\" settings.xml
sed -i "`expr $result + 6`i\\				<fuse.ignite.operator.manifest.dir>/manifests/$3</fuse.ignite.operator.manifest.dir>\\" settings.xml
sed -i "`expr $result + 7`i\\				<fuse.ignite.operator.cluster.service.spec.version>$3</fuse.ignite.operator.cluster.service.spec.version>\\" settings.xml
sed -i "`expr $result + 8`i\\				<fuse.ignite.operator.cluster.service.clusterServiceVersion>manifests/$3/fuse-online-operator.v$3.clusterserviceversion.yaml</fuse.ignite.operator.cluster.service.clusterServiceVersion>\\" settings.xml
sed -i "`expr $result + 9`i\\				<fuse.ignite.operator.config>/conf/config.yaml</fuse.ignite.operator.config>\\" settings.xml
sed -i "`expr $result + 10`i\\				<fuse.ignite.operator.upstream>$4</fuse.ignite.operator.upstream>\\" settings.xml
sed -i "`expr $result + 11`i\\			</properties>\\" settings.xml
sed -i "`expr $result + 12`i\\		</profile>\\" settings.xml

b=`wc -l < settings.xml`
echo "$b"
cat settings.xml
git add settings.xml

num_files=$(git status --porcelain  | { egrep '^\s?[MADRC]' || true; } | wc -l)
    if ((num_files > 0)) ; then
        echo "Committing $num_files"
        git commit -m "Added the profile for 7.11" .
        git push origin
    else
        echo "There are no files to be committed. Skipping commit + push"
    fi