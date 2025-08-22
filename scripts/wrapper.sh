#!/bin/bash

pulumi login --local
export PULUMI_CONFIG_PASSPHRASE=
pulumi stack init test
pulumi install
pulumi preview -s test &
PULUMI_PID=$!
echo PULUMI_PID=${PULUMI_PID}
intr_pulumi() {
    echo sending SIGINT to ${PULUMI_PID}
    kill -SIGINT ${PULUMI_PID} || echo "Error killing pulumi process."
}
trap intr_pulumi SIGINT SIGTERM SIGQUIT

wait $PULUMI_PID
