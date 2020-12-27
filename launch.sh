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
  if [[ $1 == 'dev' ]]; then
    docker build --no-cache -t vivumlab/vivumlab:dev .
    version=dev
  else
    version=$1
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

exit 0
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/oiy4ACgkQ+4SMbaIP
99Q8cBAAuyW0s0zXm7joiyHJYr37CHasPYtA75jISxPIKMHGchgaNOuEBAn8B/FP
MvS6esyL4D6uP3JfU7ipB2Wg+Dm1/yTMYVdgVfs7KharVzvwnb8d0icoVTbtjENk
jT+kIKW6H8qlov7lEi9K8Koua0KfxgMG+2Gokf8JriCYUmmEbUiVOf01cU7/A3e4
gv5uqZcwdFTnqykGTUufdU3UMMWi2iv21UAytNwSzZcTQT7UhT/pa0vrrV50/9Pm
5zrrF0FpNoRiICkF5FtPfheZbIKgfQ1FZhxux9wg8cQIclFjSBCZ/j9r2XFaQBIG
xl82tBwDalAsMLT0l1S+uiwJI58kx47X4W0G2i8xxgLBj/95Kg03sA+X9Tgs9Iag
gdECEwilua2Zj0c463CXO5WAdO3u4K48DBkKEcBiHVMpC3fQaadC8DE7FBKl0C1P
FmdeQTwm/DOTudzkbEG1F4bqlpedu/He6xtAulYKc9Lj7WCxPDy3TAHOM95xbBlr
5XzGsFrP8YGEd4s9h94K4XPEBna6Yqvua+6zJGNa7eBGO5naB4I7oQbkF0+Rjami
J5ryDbApqRheAd8UUakLlG9RqsqvPxXUuGoWB/hj1Sjn+0DHf7E2VJqeyyiwokOr
xbZ53ZOez5onIhNykKFB7ifHFCSu7lLVvz59DA0XBw4a/vs7emI=
=qSG+
-----END PGP SIGNATURE-----
