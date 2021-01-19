#!/usr/bin/env bash

#if developer run as "./launch.sh dev"
<<ENDOFSIGSTART=
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

ENDOFSIGSTART=
VERSION=latest
SKIP=0
BRANCH=
HELP=0
SUDO=
if [ "$UID" != "0" ]; then
	if [ -e /usr/bin/sudo -o -e /bin/sudo ]; then
		SUDO=sudo
	fi
fi

while getopts v:sb:h option
do
case "${option}"
in
v) VERSION=${OPTARG};;
s) SKIP=1;;
b) BRANCH=${OPTARG};;
h) HELP=1;;
esac
done

if [[ ${HELP} == '1' ]]; then
  echo "build and run: ./launch.sh -v VERSION -b BRANCH (-b optional)"
  echo "run:           ./launch.sh -v VERSION -s"
  exit 0
fi

if [[ ! -f ./launch.sh ]]; then
  echo "launch.sh is not locally available"
  echo    # (optional) move to a new line
  if [[! command -v gpg &> /dev/null]]; then
    read -p "Securely download file? (y/n):" -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      exit 1
    else
      curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/website/docs/contact%40vivumlab.xyz.gpg' | gpg --import && \
      if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/launch.sh' | gpg); then echo "$z" > launch.sh ; fi
      $SUDO chmod +x launch.sh
      mkdir $(pwd)/settings
    fi
  else
    read -p "Download GPG or rely on SSL to authenticate. Rely on SSL? (y/n):" -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "================================================================="
      echo "Search how to download gpg https://duckduckgo.com/?q=download+gpg"
      echo "================================================================="
      exit 1
    else
      if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/launch.sh'); then echo "$z" > launch.sh ; fi
      $SUDO chmod +x launch.sh
      mkdir $(pwd)/settings
    fi
  fi
  echo "====================="
  echo "Run ./launch.sh again"
  echo "====================="
  exit 0
fi

### Check Docker, run if it isn't ###
if ! docker info > /dev/null 2>&1 ; then
  printf "Starting Docker.."
  echo    # (optional) move to a new line
  if [[ "$OSTYPE" == "darwin"* ]]; then
    open -g -a Docker.app || exit
  elif [[ `systemctl` =~ -\.mount ]]; then
    sudo systemctl start docker
  elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then
    sudo service docker start
  fi
fi
if [ ${SKIP} == '0' ]; then
  if [ ${VERSION} == 'local' ]; then
    if [ ! -n "${BRANCH}" ]; then
      docker build --build-arg ARG_VERSION=dev --no-cache -t vivumlab/vivumlab:${VERSION} -f ./docker/Dockerfile.dev .
      if [[ $? != '0' ]]; then
        exit $?
      fi
    else
      docker build --build-arg ARG_VERSION=${BRANCH} --no-cache -t vivumlab/vivumlab:${VERSION} -f ./docker/Dockerfile .
      if [[ $? != '0' ]]; then
        exit $?
      fi
    fi
  else
    docker pull vivumlab/vivumlab:${VERSION}
  fi
fi

function pwless_sshkey () {
  if [ -z ${PASSWORDLESS_SSHKEY} ]; then
    PASSWORDLESS_SSHKEY='id_rsa'
    echo $PASSWORDLESS_SSHKEY
  else
    echo $PASSWORDLESS_SSHKEY
  fi
}

if [[ ! -f ~/.vlab_vault_pass ]]; then
  touch ~/.vlab_vault_pass
fi

if [[ ${VERSION} == 'latest' ]]; then
  gitVERSION=master
elif [[ ${VERSION} == 'local' ]]; then
  gitVERSION=local
else
  gitVERSION=v${VERSION}
fi

if [[ ${VERSION} != 'local' && ${VERSION} != 'dev' ]]; then
  clear
fi
cat vivumlablogo.txt

if [[ ${VERSION} == 'local' || ${VERSION} == 'dev' ]]; then
  docker run --rm -it \
    -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
    -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
    -v $(pwd):/data \
    -v $(pwd)/settings:/data/settings \
    -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
    vivumlab/vivumlab:${VERSION} /bin/bash
else
  docker run --rm -it \
    -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
    -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
    -v $(pwd)/settings:/data/settings \
    -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
    vivumlab/vivumlab:${VERSION} /bin/bash
fi

<<ENDOFSIGSTART=
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAmAGG+oACgkQ+4SMbaIP
99SWBxAAkVT40AK04+p46swS6DDxVmIqc7cb58sB72pDIlYDLGdY+IXD/+EmB7N+
wLKTt1wJmafIO5J2GqUw/BGtPu9myGkU3rlr0XneIy1q2/cN5CH8/l0XuYS88Avw
QNRn7iViTSrX0Aysb/vZC13oPCO11F1L6J4sZVY0rgtbyWK8IQG02QL8N3hZqn0K
dCyhu1puIt/pIf8a7jjzM0HsYm5qbEJSFqtRMoCDdLwxSQg16TcvsWDaUk857TCG
EwrRfCS0PG75U90bpr1pKuiW4jmTEyWrHwpzhBfNHVdD3PQYImyJi7az19A6HDU1
hYS6CWxQFhMYmiAurwoI8QH11Nf7fyclcZwYTH3yNlwCBaxPbbXBtYIRxSniW7fZ
V5b3YXE12IbCq+sMGAAjtIIgTUpgtTpZJqLRkwsKVy16AQ2vS6DWGJpMXnnRfz/o
09czb6TeYMdk76Ly4fc5nfUHE+wIk3V+l+Y1K0jv5lvaKNUsc4WucTVjzIVItpW4
IFtfzOmYXj6Re3WelC5xByifEP0IHclvjO1TJ6+Ms0aLoXVnCdIn+iQr2grwgaKu
AYi5/FH59+8rkmxjHKhx28RI9ggG0e3/GF8pYe4ia9A2RsVY98J/mAq4A18oZz5J
pI3+wPY8TfzcMTS2f6+bAYACI8sVwUm3zh0OTLYH9M4EETToh7g=
=c3td
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
