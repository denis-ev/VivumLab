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
cat MOTD

docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
  vivumlab/vivumlab:${version} /bin/bash

<<ENDOFSIGSTART=
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/rFK0ACgkQ+4SMbaIP
99QMCQ/8Du5tYFC/9O4sgpR+IhzMh0YcT1H+1Y4pN/YhSmNBL8WVvs9E0siJm/6B
6eWztPVSW+OqEQFRO11FidpyPwjwfJfMMOKQBU9Kx9dn1sJAgwo+fwRkXF6ucq1f
j7coUwtj4E4MWZWkPIOUdyBmSCldz5Ceu6/aK07S8hn04hMB3Yc8NBNDD36QS7rZ
om68IR6x/edvXkwDV7hmsHWjLVEuWQhR6us1VjZZX19OxAdKRTfFe4DZw56bCk78
lShgOqrts09z+66sOqTbhLZb2hnn83n5OKXKjrLN2IeS1xPlf5X48lHlYlsHdv7L
kfFdEhMTiXhl9MSxBTXls9BIQXz6QtwtE1Uoc0DOTAKSsRfOe7shGwd3qXMqKhgb
eIUAimicrvFEjB493HYafJsvk/Me9c/xiAJ4+yS5KXcP+VAP2UNRr7zbHpBJlGik
Y+4aYfJ7h+noT29ppuWV8viXBBiD0Gd5qZGx6Mmx+om/ywOj0BL4yq/pJwS4TBLP
S2mSjbWTB04b/tNSt4nkUpm1AeeD9GirXJEBVqYWfGHFBhOl3MUgRlUoEBNzwJjj
vS4yom0Z5kvhMvlftUulCK2dtXVPejRTIXmfQ4p83xIL9jxJU/8ilZnt10R2RKZj
HNlBnKoykC/oNFaDjOVxZDqutxnpmfIRvds9eADvJU4ceG71BDc=
=CNMI
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
