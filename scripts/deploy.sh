#!/bin/bash

echo "TRACING=${TRACING}"

intr_pulumi() {
    echo "signal received in deploy.sh"
}
trap intr_pulumi SIGINT SIGTERM SIGQUIT


./scripts/entrypoint.sh
