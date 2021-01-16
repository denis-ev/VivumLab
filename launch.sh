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
      docker build --build-arg ARG_VERSION=dev --no-cache -t vivumlab/vivumlab:${VERSION} -f Dockerfile.dev .
      if [[ $? != '0' ]]; then
        exit $?
      fi
    else
      docker build --build-arg ARG_VERSION=${BRANCH} --no-cache -t vivumlab/vivumlab:${VERSION} .
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

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAmACqoMACgkQ+4SMbaIP
99TPcw/9Hnpg068DlIOUJ6X1tGxkrL7Ky0p2WsqgzSqohbMF2fhfsQpgj9c01XrD
MuVo4mSbz7ZS9vSyTbNH6eQVSBRWzVzS3j4FViupyB9Sk/jTvLKAc9vEXESBkL/m
X78Wxy0pmugFo+VQBSohPj+yT0V5ApP6P7O4QAE9vOYkHZGAiYAtD6nQ+Lc3bL39
vmzjyGXXh0DIaUQgpTiNfHk830iliWpVx6nL5/oyfYNJYvEPNvJeK27D2F3IFD86
YYGNICLvas6hbWQHWNERMuRwV+HS4zr+EVlwoTNoJMsILW2yB8Ibzjz9jh/p8Z6d
Mt0/5PrdBO4UaBY5ljua9Z3TSVQRfL5hmVFJtqiiB85T4G3RcRxZAHOS/gbs5JtD
Qy5Aq5/eOhn31X3IlXvG3yUJ6JNkOMyuv+Gh4+xpFYk/dMwQcJcb8ViHRIpd08Np
GXfj024bY26rbbzfrlpuy+7R1QR7DJcWsYIVgYOLzJ1CbLXMzFvI5pRH6l2RIE3O
p1bCRhbr41qM26HB8+H7M4oGkpx/iZSOHoxagHrBDRjWBHqQMfIPYDBEJ2O9TZyq
2cBddZhEqTfNIAbcUWBq9S+BfN+zLV/E96EhVXDWUXF6zX1ifX5EG4JPg8Lcm7iA
cM2OKoKFKoLnv0IDT07JaE/t3mAzKgptR0URWk1jPHuOkB0MXWE=
=MCF2
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
