#!/bin/bash

cat <<EOF | kubeseal -o yaml --scope cluster-wide
apiVersion: v1
kind: Secret
metadata:
  name: stringData-secret
type: Opaque
stringData:
  OVH_ENDPOINT: 
  OVH_APPLICATION_KEY: 
  OVH_APPLICATION_SECRET: 
  OVH_CONSUMER_KEY: 
EOF
