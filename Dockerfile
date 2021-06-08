FROM registry.fedoraproject.org/fedora-minimal:latest
ARG JQ_VERSION=1.6
ARG YQ_VERSION=4.9.3
ARG OC_VERSION=4.7.14
RUN microdnf -y install glibc-langpack-en gnuplot tar gzip ncurses java-11-openjdk-headless maven && \
    microdnf clean all && \
    curl -Lo /usr/local/bin/hey https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 && \
    chmod +x /usr/local/bin/hey && \
    curl -Lo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    curl -Lo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp-dev-preview/latest-4.7/openshift-client-linux-${OC_VERSION}.tar.gz | tar -C /usr/local/bin -xzf -
ENV LC_ALL="en_US.UTF-8"
