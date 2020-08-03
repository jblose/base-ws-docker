# Base Workstation - Dockerized

Purpose of this container is strictly an on the fly deployment of a Centos 8 COntainer which has the following tools:

- Ansible
- Azure CLI
- Kubectl
  - Argo for Kubectl
- Networking tools
  - bind-utils

## Building

```bash
docker build -t centos-ws .
```

## Execution

```bash
# Git-Bash from Windows
winpty docker run -it --rm --name centos-ws -v //c/Users/<user name>/.kube/config:/root/.kube/config centos-ws
```
