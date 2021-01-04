#!/usr/bin/env bash

#if developer run as "./launch.sh dev"
<<ENDOFSIGSTART=
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

ENDOFSIGSTART=
SUDO=
if [ "$UID" != "0" ]; then
	if [ -e /usr/bin/sudo -o -e /bin/sudo ]; then
		SUDO=sudo
	fi
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
      if [[ $1 == 'dev' ]]; then
        curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/dev/website/docs/contact%40vivumlab.xyz.gpg' | gpg --import && \
        if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/dev/launch.sh' | gpg); then echo "$z" > launch.sh ; fi
        $SUDO chmod +x launch.sh
      else
        curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/website/docs/contact%40vivumlab.xyz.gpg' | gpg --import && \
        if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/launch.sh' | gpg); then echo "$z" > launch.sh ; fi
        $SUDO chmod +x launch.sh
      fi
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
      if [[ $1 == 'dev' ]]; then
        if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/dev/launch.sh'); then echo "$z" > launch.sh ; fi
        $SUDO chmod +x launch.sh
      else
        if z=$(curl -s 'https://raw.githubusercontent.com/VivumLab/VivumLab/master/launch.sh'); then echo "$z" > launch.sh ; fi
        $SUDO chmod +x launch.sh
      fi
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

if [[ -z $1 ]]; then
  version=latest
else
  if [[ $1 == 'local' ]]; then
    if [[ $2 != 'start' ]]; then
      docker build --no-cache -t vivumlab/vivumlab:local .
    fi
    version=local
  else
    version=$1
    docker pull vivumlab/vivumlab:${version}
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

clear
cat vivumlablogo.txt

docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
  vivumlab/vivumlab:${version} /bin/bash

<<ENDOFSIGSTART=
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/ruZQACgkQ+4SMbaIP
99R+yw/9GsJuyZjN1+7ixUPLFuBhINYjGI6jLUN5RkFuAv2CeX8MMZDNnEGHWacv
2AKJugBenhrFP+nCkRMlJ+roaSsRKage1juipznyImAMPjJYfCfIAwVrcNLEn2un
D+44QaFnl5+xBfDMSY6XnMiD1dKpVmag1ag+tfz2YwUS4a+j5JB3qvE/YIo6JC9A
00z5ISsvGMv/0jQXAdn/3PhuVN3Nn2AeEA2BaN/BLnQQugQZqNKdtINQ7LeorHnd
Qd539RSO9X7KaJv6p3y7uimu+Hql/92N102JxH9Ec+mbCEIk/U/dEZ80HNOwx2ej
Falw63MOEULauxdRFfEx0Hi4kpgFSC5cwEgMT80nsc+6nktRpFS/AkcLmO7tUNwr
7EEegjul56/Ey9Oe6Uch9h04HPeSdO3OAZyR8c7pXQFDaR7UeZRag49+3V5+9Bb4
wXBzRHNbSQ6R/NKw7X8wQPNAwHX/bT3NzxUbwzyTyrunXsSDYXU+xwK0bMa5Vtjg
WPdnIc3LpiDIVcVi5l2HZxEU0Lxf/UxveweRZOXJqxpA4t3f+JZloVqEBxBWcTd/
GcbCH03mgfVHGlFZHaBqMwBQiMWHNLvxNC7fvmGeaLcszeIiUjmdThFeWqfIVfeN
vfRlQkkpaRNBAlv4XafgjLjv9U/dhX/+zLlG08IluJLW2pYtVKo=
=UXJd
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
