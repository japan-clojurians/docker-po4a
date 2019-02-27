FROM debian:stretch-slim

ENV PO4A_VERSION="0.55"
ENV PERLLIB=/opt/po4a-${PO4A_VERSION}/lib

RUN apt-get update -y && \
    apt-get install wget \
                    # texinfo \
                    gettext  -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /opt/po4a-${PO4A_VERSION}.tar.gz https://github.com/mquinson/po4a/releases/download/v${PO4A_VERSION}/po4a-${PO4A_VERSION}.tar.gz \
    && tar -xzf /opt/po4a-${PO4A_VERSION}.tar.gz -C /opt \
    && ln -s /opt/po4a-${PO4A_VERSION}/po4a /usr/local/bin/. \
    && ln -s /opt/po4a-${PO4A_VERSION}/po4a-gettextize /usr/local/bin/. \
    && ln -s /opt/po4a-${PO4A_VERSION}/po4a-normalize /usr/local/bin/. \
    && ln -s /opt/po4a-${PO4A_VERSION}/po4a-translate /usr/local/bin/. \
    && ln -s /opt/po4a-${PO4A_VERSION}/po4a-updatepo /usr/local/bin/.

WORKDIR /tmp

CMD ["po4a"]