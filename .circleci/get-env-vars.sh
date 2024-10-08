#!/bin/bash

function get_env_vars() {
  if [[ $CIRCLE_BRANCH == "main" || $CIRCLE_BRANCH == "feature/init-CD" ]]; then
    echo 'export env="prd"' >> "$BASH_ENV"
  else
    echo 'export env="stg"' >> "$BASH_ENV"
  fi
}