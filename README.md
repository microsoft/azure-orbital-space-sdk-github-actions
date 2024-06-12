# Azure Orbital Space SDK Github Actions
[![Run tests](https://github.com/microsoft/azure-orbital-space-sdk-github-actions/actions/workflows/run-tests.yaml/badge.svg)](https://github.com/microsoft/azure-orbital-space-sdk-github-actions/actions/workflows/run-tests.yaml)

This repo contains the components of what we on the dev team have nicknamed "Hydra", and it is the templates and actions that create a common source for consistency in our github workflows.  These composite actions and shared workflows are re-used across the many Space SDK repos.  

## Why call it Hydra?
In ancient mythology, a hydra was a beast that had a single body, but many heads, and for each head you cut off, more would appear.  The architecture of our deployment system is similar.  This repo implements common actions and templates which make up the "body" of our deployment system, while each repo that comprises the SDK acts as a head that leverages these templates to deploy.  

## Testing Composite Actions
We have built a framework where we use workflows on this repo to test these actions.  This is done by creating a workflow to test a composite action, and then adding a call to the [run-tests.yaml](./github/workflows/run-tests.yaml).  You will also notice that all of our tests are setup to run on both amd64 and arm64 as we compile all artifacts in the space sdk to support both cpu architectures.  
