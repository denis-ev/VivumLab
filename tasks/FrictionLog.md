# Friction Log

# Pre install
* Python3 not installed as python, but dev_setup calls python not Python3
* Python3-dev is required to install pre-commit
* Pre-commit is needed for all interaction
* docker not installed
# During Deploy
* deploy fails because python3 is not installed by default on ubuntu server
* deploy fails because anisble defaults to /usr/bin/python, but ubuntu sets it as /usr/bin/python3
    * fixed by adding ansible_python_interpreter: "/usr/bin/python3"
* User was not in docker group
* cannot create /var/vivumlab dir
* when the directories cannot be created, copying the version file fails

# Post Deploy
* Traefik not started
    * Cannot connect to docker server context canceled
* Sui couldn't start without traefik
