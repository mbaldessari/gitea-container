ARG TEA_VERSION
FROM registry.access.redhat.com/ubi9/ubi-minimal:latest
ARG TEA_VERSION # After every from ARG vars are collected so reexport it

RUN microdnf install git-core tar xz jq -y && microdnf clean all
RUN curl -L -o /tmp/tea.xz https://dl.gitea.com/tea/${TEA_VERSION}/tea-${TEA_VERSION}-linux-amd64.xz && xz -d /tmp/tea.xz && mv /tmp/tea /usr/local/bin && chmod 0755 /usr/local/bin/tea
