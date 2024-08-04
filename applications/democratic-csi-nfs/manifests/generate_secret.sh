#!/bin/bash

# Truenas config:
# https://github.com/fenio/k8s-truenas

# Kubeseal:
# https://github.com/bitnami-labs/sealed-secrets?tab=readme-ov-file#linux

cat <<EOF | kubeseal -o yaml --scope cluster-wide
apiVersion: v1
kind: Secret
metadata:
  name: democratic-driver-config-nfs
  namespace: democratic-csi
type: Opaque
stringData:
  driver-config-file.yaml: |-
    driver: freenas-api-nfs
    instance_id:
    httpConnection:
      protocol: http
      host: "CHANGE-ME" # <----
      port: 80
      apiKey: "CHANGE-ME" # <----
      allowInsecure: true
    zfs:
      datasetParentName: "CHANGE-ME" # <----
      detachedSnapshotsDatasetParentName: "CHANGE-ME" # <----
      datasetEnableQuotas: true
      datasetEnableReservation: false
      datasetPermissionsMode: "0777"
      datasetPermissionsUser: 0
      datasetPermissionsGroup: 0
    nfs:
      shareHost: "CHANGE-ME" # <----
      shareAlldirs: false
      shareAllowedHosts: []
      shareAllowedNetworks: []
      shareMaprootUser: "CHANGE-ME" # <----
      shareMaprootGroup: "CHANGE-ME" # <----
      shareMapallUser: ""
      shareMapallGroup: ""
EOF
