FROM ruby:3.0-slim-buster as compiler

LABEL maintainer="VivumLab <support@vivumlab.xyz>" \
    description="VivumLab container with Ruby Version 3 to run the CLI" \
    org.label-schema.name="VivumLab" \
    org.label-schema.description="VivumLab container with Ruby Version 3 to run the CLI" \
    org.label-schema.url="https://github.com/VivumLab/VivumLab/#readme" \
    org.label-schema.vcs-url="https://github.com/VivumLab/VivumLab" \
    org.label-schema.vendor="VivumLab" \
    org.label-schema.schema-version="1.0"

ARG ARG_VERSION="master"

ENV VER_TERRAFORM=0.14.4

ENV PYTHONUNBUFFERED=1

# Environments
ENV TARGET_UID=1000
ENV TARGET_GID=1000
ENV VERSION=$ARG_VERSION

ENV BUILD_PACKAGES \
    tini=0.18.0-1 \
    wget=1.20.1-1.1 \
    curl=7.64.0-4+deb10u2 \
    unzip=6.0-23+deb10u2 \
    less=487-0.1+b1 \
    git=1:2.20.1-2+deb10u3 \
    jq=1.5+dfsg-2+b1 \
    nano=3.2-3 \
    vim=2:8.1.0875-5 \
    python3-dev=3.7.3-1 \
    python3-distutils=3.7.3-1 \
    python3-wheel=0.32.3-2 \
    python3-venv=3.7.3-1 \
    python3-pip=18.1-5 \
    build-essential=12.6 \
    ssh=1:7.9p1-10+deb10u2 \
    apt-utils=1.8.2.3 \
    gcc=4:8.3.0-1

# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

COPY Gemfile /Gemfile
COPY Gemfile.lock /Gemfile.lock
COPY docker/requirements.txt /requirements.txt

# Update and install packages
RUN set -eux && \
    # Tell apt-get we're never going to be able to give manual
    # feedback:
    export DEBIAN_FRONTEND=noninteractive && \
    # Update the package listing, so we know what package exist:
    apt-get update && \
    # Install apt-utils
    apt-get -y install --no-install-recommends apt-utils && \
    # Install security updates:
    apt-get -y upgrade && \
    # Install production packages, without unnecessary recommended packages:
    apt-get -y install --no-install-recommends ${BUILD_PACKAGES} && \
    # Link Python3 to /usr/bin/python
    ln -sf python3 /usr/bin/python && \
    \
    python3 -m venv /opt/venv && \
    # pip3 install
    pip3 install wheel && \
    pip3 install --no-cache -r requirements.txt && \
    \
    echo "==> Installing Terraform..." && \
    wget https://releases.hashicorp.com/terraform/${VER_TERRAFORM}/terraform_${VER_TERRAFORM}_linux_amd64.zip && \
    unzip terraform_${VER_TERRAFORM}_linux_amd64.zip && \
    rm terraform_${VER_TERRAFORM}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    \
    echo "==> Installing gems"  && \
    bundle install
    # && \
    # \
    # # Delete cached files we don't need anymore:
    # echo "==> Clean apt-get cache" && \
    # apt-get clean && \
    # rm -rf /var/lib/apt/lists/*

###
### This is the end-user facing image
###
FROM ruby:3.0-slim-buster as prod

LABEL maintainer="VivumLab <support@vivumlab.xyz>" \
    description="VivumLab container with Ruby Version 3 to run the CLI" \
    org.label-schema.name="VivumLab" \
    org.label-schema.description="VivumLab container with Ruby Version 3 to run the CLI" \
    org.label-schema.url="https://github.com/VivumLab/VivumLab/#readme" \
    org.label-schema.vcs-url="https://github.com/VivumLab/VivumLab" \
    org.label-schema.vendor="VivumLab" \
    org.label-schema.schema-version="1.0"

ARG ARG_VERSION="master"

COPY --from=compiler /opt/venv /opt/venv
COPY --from=compiler /usr/local/bundle /usr/local/bundle
COPY --from=compiler /usr/local/bin/terraform /usr/local/bin/terraform

# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"

ENV PYTHONUNBUFFERED=1

# Ansible ENV Variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_ROLES_PATH /data/roles
ENV ANSIBLE_SSH_PIPELINING True
ENV ANSIBLE_VAULT_PASSWORD_FILE /vlab_vault_pass
ENV ANSIBLE_CONFIG=/data/ansible.cfg
ENV PYTHONPATH /ansible/lib
ENV PATH /ansible/bin:$PATH
ENV ANSIBLE_LIBRARY /ansible/library
ENV ANSIBLE_STRATEGY_PLUGINS=/opt/venv/lib/python3.7/site-packages/ansible_mitogen/plugins/strategy/
ENV ANSIBLE_STRATEGY=mitogen_linear

# Environments
ENV TARGET_UID=1000
ENV TARGET_GID=1000
ENV VERSION=$ARG_VERSION

ENV PROD_PACKAGES \
    tini=0.18.0-1 \
    wget=1.20.1-1.1 \
    curl=7.64.0-4+deb10u2 \
    unzip \
    less=487-0.1+b1 \
    git=1:2.20.1-2+deb10u3 \
    jq=1.5+dfsg-2+b1 \
    nano=3.2-3 \
    vim=2:8.1.0875-5 \
    python3=3.7.3-1 \
    python3-distutils=3.7.3-1 \
    ssh \
    libncurses-dev=6.1+20181013-2+deb10u2

COPY docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY docker/motd /etc/motd

RUN set -eux && \
    # Tell apt-get we're never going to be able to give manual
    # feedback:
    export DEBIAN_FRONTEND=noninteractive && \
    # Update the package listing, so we know what package exist:
    apt-get update && \
    # Install security updates:
    apt-get -y upgrade && \
    # Install production packages, without unnecessary recommended packages:
    apt-get -y install --no-install-recommends ${PROD_PACKAGES} && \
    \
    echo "==> Installing syntax highlighting for nano" && \
    curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh && \
    \
    echo "==> Create /data" && \
    mkdir /data && \
    \
    echo "==> Cloning VivumLab"  && \
    git clone --branch ${VERSION} https://github.com/VivumLab/VivumLab.git /data && \
    \
    echo "==> Linking vlab into path" && \
    ln -s /data/vlab /usr/local/bin/vlab && \
    \
    echo "==> Make sure docker-entrypoint.sh is executable" && \
    chmod +x /docker-entrypoint.sh && \
    \
    # Delete cached files we don't need anymore:
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

VOLUME [ "/data/settings" ]
ENTRYPOINT ["/usr/bin/tini", "--", "/docker-entrypoint.sh"]
