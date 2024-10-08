#!/bin/bash

function get_env_vars() {
  if [[ $CIRCLE_BRANCH == "main" || $CIRCLE_BRANCH == "feature/init-CD" ]]; then
    echo 'export env="prd"' >> "$BASH_ENV"
  else
    echo 'export env="stg"' >> "$BASH_ENV"
  fi
}

function set_up_pre_build() {
  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  cd ~
  wget https://github.com/digitalocean/doctl/releases/download/v1.110.0/doctl-1.110.0-linux-amd64.tar.gz
  tar xf ~/doctl-1.110.0-linux-amd64.tar.gz
  sudo mv ~/doctl /usr/local/bin
}