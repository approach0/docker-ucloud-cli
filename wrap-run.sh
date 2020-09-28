#!/bin/bash
pubkey=$1
prikey=$2
shift
shift
sed -i "s/PUBKEY/$pubkey/g" /root/.ucloud/credential.json
sed -i "s/PRIKEY/$prikey/g" /root/.ucloud/credential.json
linode-cli $@
