# Operator SDK image

Container image for building operators in a CI pipeline. The image contains the following tools:

- podman - v2.1.1
- operator-sdk - v1.2.0
- ansible-operator - v1.2.0
- helm-operator - v1.2.0
- golang - v1.15.2
- oc cli - v4.5.9
- opm cli - v1.15.3
- kustomize - v3.8.4
- "Developer Tools" group (make, gcc, etc)
- openssl

## Container image

The container image can be found at https://quay.io/repository/ibmgaragecloud/operator-sdk

## Image build

The container image build is triggered automatically via a GitHub action when commits are pushed to `main` branch or new tags/releases are created. Pushes to `main` branch are tagged as `latest` while git tags are used as image version tags.

