#!/bin/bash


DEVCONTAINER_JSON=$(devcontainer read-configuration --workspace-folder ${PWD})

DEVCONTAINER_JSON=$(echo "$DEVCONTAINER_JSON" | jq '.configuration.features."ghcr.io/microsoft/azure-orbital-space-sdk/spacefx-dev:0.11.0"."smb_enabled_in_cluster" = true')
DEVCONTAINER_JSON=$(echo "$DEVCONTAINER_JSON" | jq 'del(.configuration.configFilePath)')
echo "$DEVCONTAINER_JSON" | jq '.configuration' > ${PWD}/.devcontainer/devcontainer.json

cat ${PWD}/.devcontainer/devcontainer.json