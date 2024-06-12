# Azure Orbital Space SDK Github Actions
[![Run tests](https://github.com/microsoft/azure-orbital-space-sdk-github-actions/actions/workflows/run-tests.yaml/badge.svg)](https://github.com/microsoft/azure-orbital-space-sdk-github-actions/actions/workflows/run-tests.yaml)

This repo contains the components of what we on the dev team have nicknamed "Kraken", and it is the templates and actions that create a common source for consistency in our github workflows.  These composite actions and shared workflows are re-used across the many Space SDK repos.  

## Why call it Kraken?
In ancient mythology, a kraken was a beast that had a single body, but leveraged many tentacles / arms.  The architecture of our deployment system is similar.  In that this repo, we maintains common composite actions and shared workflows that are implemented across the many repos that support and make up the Azure Orbital Space SDK.  The intention being that these templates make it easier to implement consistent qualities and actions to support the Azure Orbital Space SDK.  

## Testing Composite Actions
We have built a framework where we use workflows on this repo to test these actions.  This is done by creating a workflow to test a composite action, and then adding a call to the [run-tests.yaml](./github/workflows/run-tests.yaml).  You will also notice that all of our tests are setup to run on both amd64 and arm64 as we compile all artifacts in the space sdk to support both cpu architectures.  
