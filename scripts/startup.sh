#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/

# load settings from Consul ONLY IF 
if [ "$CONF_SERVER_ADDR" != "" ]; then
  # 1. /dev/settings (common envs)
  consul kv get -http-addr=$CONF_SERVER_ADDR -token=$CONF_SERVER_TOKEN -datacenter=dc1 qubeship/envs/$ENV_TYPE/settings >> settings.json
  #cat settings.json

  # 2. /dev/<user> (user-specific envs)
  if [ "$ENV_ID" != "" ]; then
    consul kv get -http-addr=$CONF_SERVER_ADDR -token=$CONF_SERVER_TOKEN -datacenter=dc1 qubeship/envs/$ENV_TYPE/$ENV_ID/settings >> settings_$ENV_ID.json
    #cat settings_$ENV_ID.json
    # 2-1. merge 2 jsons
    echo `jq -s '.[0] * .[1]' settings.json settings_$ENV_ID.json` > settings.json
  fi

  # 4. export all envs but those: *ENV*
  for key in `jq -r 'keys[]' settings.json`; do \
    if [[ $key =~ (ENV|TENANT) ]]; then
      continue; \
    fi; \
    export $key=`jq .${key} settings.json | sed -e 's/\"//g'`; \
  done

  # 5. test
  #env
fi

python -m qube.src.api.app --debug 2>&1 > nohup.out
tail -f nohup.out