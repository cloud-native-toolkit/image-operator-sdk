FROM quay.io/buildah/stable:v1.15.1

ARG OPERATOR_SDK_VERSION=v1.0.1
ARG GOLANG_VERSION=1.15.2
ARG OCCLI_VERSION=4.5.9

RUN curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && \
    chmod +x operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu && \
    cp operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu /usr/local/bin/operator-sdk && \
    rm operator-sdk-${RELEASE_VERSION}-x86_64-linux-gnu

RUN curl -OJL https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    rm go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    ln -s /usr/local/go/bin/* /usr/local/bin

RUN curl -OJL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCCLI_VERSION}/openshift-client-linux.tar.gz && \
    tar -C /usr/local/bin -xzf openshift-client-linux.tar.gz && \
    rm openshift-client-linux.tar.gz

