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

iQIzBAEBCAAdFiEEjy1P4AM9/4EN573P+4SMbaIP99QFAl/2djMACgkQ+4SMbaIP
99Q+Sw/+K9Z63yYnYgQH4Vx7Jn7y80fx7/+19olIjZRrQ74wHBAVHvlz+l4t8P2b
UhbDA4Z5TuJfxdIfEgW1HatdFzgC7b4gdoswcrQZOYI+cTmQ7MxGV80FiMcVUP9e
U5QD22UBC17n2In2B1R49LUhLIoKOSxaZJhwfqZzDf9zPLTAOw2whYrHePw3gmI2
VOTdot6oo8dvlRoJNw9tEaKhMAkLBZyFgfbQKi0sNo7QOuqK4NQGZH156onoBoRy
CTx+RxElqdfuP8uOGLO6RDENyrZz1/3/VaLS19j/FgZpEnKSAZ2KznCWuAxUsLvD
+gaZmfVZWtpIUs58n40U+ar0rNf7/snBfNq/UenilMDx/m1Hbpr4hpQX68Ug6UiL
lbIQWn8CTDynbK7TV5YxRYu5i6xvi4wc/PLFtHc86Qasl8JtQ1yC3PEu2+yNJFmk
Jo+O35ma+lGtOxv94x/JQIahLyS9bHvlBfedr0w9iDNn38tW8VD7U8zLF3qcVeW9
ugsnlkZWsP37j1yT4XXyVHyvAQawaFhj/IU9X0QVmJGteBixBW52J9FQ50zg6KoF
iS/binZCCjzPBacM4qrkqIRXwhIb+SKSZYMxloAHTKDIRxanZLPcgNGivRu6hVa+
vbVmiyJgHqWcT2POfZQ3UehCY13DQeKgI0zv9a8ml7m+asZngv8=
=HrkQ
-----END PGP SIGNATURE-----
ENDOFSIGSTART=
