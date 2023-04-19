#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

cd $DIR/..

CHARTS_DIR="repo"

# Bundle Kafka Lag Exporter Helm Chart into a tarball artifact.  The `helm package` command will output the artifact
# in the CHARTS_DIR.
echo Package helm chart
PACKAGE_NAME="$( awk '/^name:/ {name=$2} /^version:/ {version=$2} END {print name"-"version".tgz"}' ./charts/kafka-lag-exporter/Chart.yaml)"
curl --data-binary @"$CHARTS_DIR/${PACKAGE_NAME}" https://chart.p.cyberx-ops.com/api/charts