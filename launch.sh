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

if [[ ${VERSION} == 'local' || ${VERSION} == 'dev' ]]; then
  docker run --rm -it \
    -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)":z \
    -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub":z \
    -v $(pwd):/data:z \
    -v $(pwd)/settings:/data/settings:z \
    -v $HOME/.vlab_vault_pass:/vlab_vault_pass:z \
    vivumlab/vivumlab:${VERSION} /bin/bash
else
  docker run --rm -it \
    -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)":z \
    -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub":z \
    -v $(pwd)/settings/:/data/settings/:z \
    -v $HOME/.vlab_vault_pass:/vlab_vault_pass:z \
    vivumlab/vivumlab:${VERSION} /bin/bash
fi

<<ENDOFSIGSTART=
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAmAwT44ACgkQ+4SMbaIP
99SaeQ//cP15wLe3TR0l6WZHS9ueeU8W2wNYFH0mrBtYwWaGAJKZsntTsrnrxxlv
YwJ+nAN59eT8oDxUzFnVWJ8QeS/k7RSWo+o6yxDYias74ebsglt8uo2oe84Lpegs
o9s1uOZ93HWTmvarVq561sL7hOFrhu8OQVQQ7u03Q+SoOCGEEDKByztKMbM5Slvo
hbshksshwfxbnAJNPWgZaNOvUXegim9HL4ZhGK6lZjeqH7/LzpXSxUJ+eKISkdnA
3vW95NdLOGcbbQzpLGBGb3Np7n+B+cN3zQU9F/xumSR2EdejAPc7qyw8+WCaUEjK
AjmEs2+jJsqXdNEpBn/pWjkF8fUUFSsOOCjkVkZc6Dfvc8bm4avpYlYzE8EbC36O
QCZ3U5g6O8RRtACjVFKHAEDpm39tmGgbM/jZyTwWrtcepLGa9ryyjjjq5EoBhrm9
FTrGg2ttfiEg5ss5jgytAkR2Pcd4OYPIJIsnuy6vHXTISsV+WfAqTGzgXM3GGqeV
Uq/NzwV+zFuH1tliGouDnC6+vvp4jksCCqIE9Dvn62/GAqt1UETEf2aUW1x/7KSE
v9L42pqSTQQEYcJWjtPXYXSzv6Xwt0roFeFIzAePV/Xnts0V7Esg7RHhBNUrVHDJ
ldSKWfU9aejytiW0BIVMrn94ZUUt1NnjL6xkVox4z2/oglnVozo=
=nEM4
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
