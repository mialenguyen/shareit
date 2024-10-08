#!/bin/bash

function get_env_vars() {
  # Environment variables for prod and staging
  if [[ $CIRCLE_BRANCH == "main" || $CIRCLE_BRANCH == "feature/init-CD" ]]; then
    echo 'export env="prd"' >> $BASH_ENV
    echo 'export cluster="test-cluster-1"' >> $BASH_ENV
    echo 'export namespace="clockwork"' >> $BASH_ENV
  else
    echo 'export env="stg"' >> $BASH_ENV
    #echo 'export cluster="test-cluster-1"' >> $BASH_ENV
  fi
}

function set_up_environment() {
  # Install Helm
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

  # Install DigitalOcean cli
  cd ~
  wget https://github.com/digitalocean/doctl/releases/download/v1.110.0/doctl-1.110.0-linux-amd64.tar.gz
  tar xf ~/doctl-1.110.0-linux-amd64.tar.gz
  sudo mv ~/doctl /usr/local/bin
}