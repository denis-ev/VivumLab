FROM alpine:3.13

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
# curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | awk {' print $2 '} | sed 's/"//g' | sed 's/,//' | sed 's/v//'

# Ansible ENV Variables
ENV ANSIBLE_VERSION 2.9.11
ENV MITOGEN_VERSION 0.2.9
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
ENV ANSIBLE_STRATEGY_PLUGINS=/usr/local/lib/python3.7/dist-packages/ansible_mitogen/plugins/strategy
ENV ANSIBLE_STRATEGY=mitogen_linear

# Environments
ENV TARGET_UID=1000
ENV TARGET_GID=1000
ENV VERSION=$ARG_VERSION

ENV BUILD_PACKAGES \
    bash \
    wget \
    curl \
    unzip \
    gcc \
    make \
    libffi-dev \
    openssl-dev \
    musl-dev \
    jq \
    nano \
    git

ENV PYTHON_PACKAGES \
    setuptools \
    dateutils \
    httplib2 \
    jinja2 \
    paramiko \
    python-keyczar \
    boto3 \
    docker-py \
    pyOpenSSL \
    pre-commit

# Update and install base packages
RUN apk update && apk upgrade && apk add ${BUILD_PACKAGES}
# Install ruby and ruby-bundler
RUN apk add ruby ruby-bundler
# Install python/pip echo "==> Adding build dependencies..."
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 python3-dev && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip
RUN pip3 install --no-cache --upgrade wheel
RUN pip3 install --no-cache --upgrade ${PYTHON_PACKAGES}

RUN echo "==> Installing Ansible... " && \
    pip3 install ansible==${ANSIBLE_VERSION} && \
    pip3 install mitogen==${MITOGEN_VERSION} && \
    \
    echo "==> Adding Hosts to Anisible directory for convenience..." && \
    mkdir -p /etc/ansible /ansible && \
    echo "[local]" >> /etc/ansible/hosts && \
    echo "localhost" >> /etc/ansible/hosts && \
    \
    echo "==> Installing Terraform..." && \
    wget https://releases.hashicorp.com/terraform/${VER_TERRAFORM}/terraform_${VER_TERRAFORM}_linux_amd64.zip && \
    unzip terraform_${VER_TERRAFORM}_linux_amd64.zip && \
    mv terraform /usr/local/bin && \
    echo "==> Linking vlab into path" && \
    ln -s /data/vlab /usr/local/bin/vlab && \
    echo "==> Installing sytax highlighting for nano" && \
    curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh && \
    echo "==> Cloning VivumLab"  && \
    git clone --branch ${VERSION} https://github.com/VivumLab/VivumLab.git /data && \
    cp /data/Gemfile* / && \
    cp /data/docker-entrypoint.sh / && \
    echo "==> Installing gems"  && \
    if (${VERSION} != 'local'); then bundle install; fi && \
    echo "==> Set MOTD"  && \
    cp /data/vivumlablogo.txt /etc/motd && \
    echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/issue && cat /etc/motd' >> /etc/bash.bashrc
    # if (${VERSION} == 'local'); then rm -rf /data/.* fi

# Clean APK cache
RUN rm -rf /var/cache/apk/*

WORKDIR /data

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini /docker-entrypoint.sh

VOLUME [ "/data/settings" ]
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]
