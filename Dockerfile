FROM quay.io/podman/stable:v2.0.6

ENV OPERATOR_SDK_VERSION v1.0.1
ENV GOLANG_VERSION 1.15.2
ENV OCCLI_VERSION 4.5.9

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

RUN yum -y groupinstall "Development Tools" && yum clean all

RUN curl -L https://github.com/operator-framework/operator-registry/releases/download/v1.14.3/linux-amd64-opm -o opm && \
    chmod +x opm && \
    mv opm /usr/local/bin
