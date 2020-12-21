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

### Check Docker, run if it isn't ###
function docker_check() {
    if ! docker info >/dev/null 2>&1 ; then
        colorize blue "Starting Docker.."
        if [[ "$OSTYPE" == "darwin"* ]]; then
            open -g -a Docker.app || exit
        elif [[ `systemctl` =~ -\.mount ]]; then
            sudo systemctl start docker
        elif [[ -f /etc/init.d/cron && ! -h /etc/init.d/cron ]]; then
            sudo service docker start
        fi
    fi
}

docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
  vivumlab/vivumlab:${version} /bin/bash
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/gjTgACgkQ+4SMbaIP
99RJTA/+OHndj8+VwH+6ugdyR2q12B+zTqbHLW1s1Aws+VrVnI4VChcPBvn40mqK
owNaR0XlpCzdSYjlU1P5EX8breVth0iEUB4E8zn7kE22LB9W1sD+egSAB5AIZhmH
hKPX+zMo8TH7WyXKNgKwmt49dIgeNGzZt/YJRtBv5F2bY4+JOZUwJxScbAz7ZkPs
Ks+unMNQYtOyP7jrKmGjShMn7BOb9+q1AqgpS1OOIn+XMZ8jUv2ByTpvdN++U+F4
2oXi/bY1LW3fBpEmlVTEQ9PdgVGE9tbtL0q813KpIb90QwJzidlmFnkEAcZi8qcE
piNOU1fMmgQedtDAi6m7jLWqcSbJczKmKzh0Dh077oLfgDsfCQi/ASAhJbQReoKw
yKZc3TNto1l6PQfrPDfGvnyttoZ3o2fDnvT7d74Yin9GFnYl0jZCCBscVBSAHvOZ
WilAFhWFe4K1V4Bj+FZ6Fy04P5p/lQI6XhWer/eaFPDhAeTlrhv/4LIO1eJrYq3l
1lcY+SfnjobY2py6tfouewnKV0ZNdzzbEjwSM9RLUjyhZcuvrWcLqybaAn1xZ2Oz
sF1IAvij1f3g5PPeq4VjHU/74VJuLSFZJXle7A3pQvn0N5aM6Ts5H3NAKnNOtrWT
ldz0Ij5Ezmn+O/IHMnI9xeCUnTSywfIy0Q/DPbv+6k+fc3aZdNw=
=1qm+
-----END PGP SIGNATURE-----
