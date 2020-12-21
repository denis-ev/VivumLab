#!/usr/bin/env bash

#if developer run as "./launch.sh dev"

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

SUDO=
if [ "$UID" != "0" ]; then
	if [ -e /usr/bin/sudo -o -e /bin/sudo ]; then
		SUDO=sudo
	fi
fi

if [[ ! -f ./launch.sh ]]; then
  echo "launch.sh not locally available"
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

docker run --rm -it \
  -v "$HOME/.ssh/$(pwless_sshkey)":"/root/.ssh/$(pwless_sshkey)" \
  -v "$HOME/.ssh/$(pwless_sshkey).pub":"/root/.ssh/$(pwless_sshkey).pub" \
  -v $(pwd):/data \
  -v $HOME/.vlab_vault_pass:/vlab_vault_pass \
  vivumlab/vivumlab:${version} /bin/bash
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEYNLZ/92/m7OQgyvU3Inf8MFijPAFAl/gNw4ACgkQ3Inf8MFi
jPBVbBAAoz8jCCTRoG1wkqR1bHpeKSilnAgodgGWFEutgfY5RV9ZX6B/1DHq+uEC
7QI9PS7b5EHPOLo9cdPkpF9H1AYyBtMCSRm+DfN50FT/vr94md8hHBMsaTWJPuMp
uLkzyJZ054WMs6zzvqpoH/yh247I9uGDTW/KBqenRqvnkxBhERrmPCHZ7ssmQI68
iEv8mPi2GhRbZ8aZsbymv5Eh7EAepncOUcbvb3Jxn8w8PADVkczUiCvrGemgzIqS
tLEfhSCn9HxrI5yqBIVKK5mml06kweKJOLwNfWJXw1McBykKLm/8be3mh9CXh9qr
z2f2/79Rwq6ls35Bh/FXNYrjGflLRnDzv74T8tLDcdVtnLFr9lHd70TChWRdBYcW
4DupWdtOH1lMX5pQlfnj7G1ehR+pWLiOowsBW0k8YW4g2X/py2o0bTSG5pHFYYaI
MhEafkD1ON5VkNx0sGH+UeEHvz6cSZ8h9n+G2ripu52skS43uWA78Q9JfuL6fIMY
dCSSXvtLb0F0yxmTyIl9JcFaqIFYGgJcBeFa9lHX6y3vquI9gd692rO+x66C+WRF
TspJVGOEZYKCHRn7R6qruP0GZQOGI2n50mcol93T5x7iqCE9cs7JDnAJ2FJ7lxgW
qZgLvTh+2oy9KEc+yhT5vXOKpNBzEMxj+iZgmha8hxWiz+6Fhs4=
=Q+G/
-----END PGP SIGNATURE-----
