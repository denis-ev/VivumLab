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
    else
      docker build --build-arg ARG_VERSION=${BRANCH} --no-cache -t vivumlab/vivumlab:${VERSION} .
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
    vivumlab/vivumlab:${VERSION}
else
  docker run --rm -it \
    -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
    -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
    -v $(pwd)/settings:/data/settings \
    -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
    vivumlab/vivumlab:${VERSION}
fi

<<ENDOFSIGSTART=
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAmACcl0ACgkQ+4SMbaIP
99SJABAAir0x17rComv6RbmaUw5W+6OCltudPh0TygP7D42hH/19UIkZJX3/efhs
FcebsuLSp9FxsFoW9ld7H2cpRUSoXo0eUUrlDx4Sc6/ymMOsQ8bFsOoAEgRn5cnW
gchqujxdpu2LArF2Mh2JFwgV/eC+TAuA0wMqgRGZiWl48DlfSpMOJmd/UMGfSC1A
dy14Wo3Xb49FJAc6wQhACI803H3sDUSE0s5nF1B9aoBLFHXFdQzlEyCokTojZM1A
XRYRV2zfWSLbIa5Tj5xRggXWqt2n3R2j8o+C5cXKB4KkUieqEn97UeRmgCFTEQw1
uuCoRtedd+WYzQL2ChAoGp2Yg303muB63wu3YP9Cal8vj0uMDWP4M0Jst0TOnW+L
mn9wHjzIvHsaRvbDDKTG99YwoixVU4hAOMn9mY2DQYvWXdWwMjbgEqj42EQkPn1b
hAw2K9YrS1n1qzvbsqbSLCQSD+nI65HLtq0aDv7k3wIm/Gq7BbFXh9gY53+75if7
3iWWbzEqRllplLG1Q4Lf9HGhccIyg+WyuP3GAtVQJ0Jc4A0h85ATsPfCnEEdJJMQ
NF2vxByBDz/0V3Fc2d08mjL2f2Rdi4rBRcOfNWGfeQgrJBGEVGVmrTlv5E60o4fl
8Nv+Y/nmedhIs10jrPC9bbSDK2XsT818pLC7ncNw/wZBD6DAxLI=
=lx1m
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
