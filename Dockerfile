FROM centos:8   

USER root

# OS Update First
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install openssh-clients.x86_64

# Ansible User
RUN yum -y install ansible
RUN adduser -ms /bin/bash ansible
RUN mkdir /home/ansible/.ssh
RUN chown -R ansible:ansible /home/ansible

# AZ CLI
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
COPY repos/azure-cli.repo /etc/yum.repos.d/azure-cli.repo
RUN yum -y install azure-cli

# Networking Tools
RUN yum -y install bind-utils

# Kubectl
RUN cd /usr/local/bin && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

# Kubectl Argo CD Plugin
RUN cd /usr/local/bin && curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
RUN chmod +x /usr/local/bin/kubectl-argo-rollouts-linux-amd64 && mv /usr/local/bin/kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts

# Development Tools
RUN yum -y install make

USER root
