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
    docker build --no-cache -t vivumlab/vivumlab:local .
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

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/pfgwACgkQ+4SMbaIP
99RsTA/+KqI3imkeMRzmKLYRPkKqJagm/8aRjQDI2arCeR4ZF5Nn3zG5icpRw0OC
oCw4bnEGWnmcJZfbacwHQVs0VGygFCkOxZWEmQuJammGy6BPzixuF1fC0RWu2PyS
vaD57jXK151rE2O4W7bAF/j3InQw0ce6f9hYufXRG0dG16uAWJS8RU+EoeU14al/
y5cj1RFUjyfRoCFU8iZDMa5n1WnvqEvyRa+HrNel2dq4Nvl4lVJtrRnn8FzNdhOc
wCPgry+iwpXaRgqbca3vOKq8ijgTozJB0naXcpltYNLPQUR2T2FY1OHyWSEI/Dn2
vSAlIpiwj6P5bdvR5UnTyqat4LLOH6piZ4SoiCMyg8nsQpWfchr6xIXzyKVlMTRW
nf2vSTt8IZ1ZUvEG8rghrBRNKGKp79huBjq06Nfrl+7ssExUjsA4bJ0BjqXKJaRF
wC66prjXYz2LVbjlF5ONN/6BIUzxWuo7MHZW1WjImMMyUIgf9Q9tmnrrZEfJ4QIi
INaX/Nn12pQ+0IYnAHW6RW1hQm2Fm5ZiFnCbR9EzdC/39iWfULw+UPFAwfPy+7aQ
TChcy826nk6Sp5iIMZJEiYb56Hnz4dE1mRW5gfzKu2I6kzPJdweHmV1l2UScrv3m
gAXzu0AS9JJZYXy7nceY/4pA8TaQilwQFx6rPDycRbKfo0UQErA=
=QQzj
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
