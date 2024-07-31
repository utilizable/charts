#!/bin/bash

# Truenas config:
# https://github.com/fenio/k8s-truenas

# Kubeseal:
# https://github.com/bitnami-labs/sealed-secrets?tab=readme-ov-file#linux

cat <<EOF | kubeseal -o yaml -w sealed-secret.yml
apiVersion: v1
kind: Secret
metadata:
  name: democratic-driver-config-iscsi
  namespace: democratic-csi
type: Opaque
stringData:
  driver-config-file.yaml: |-
    driver: freenas-api-iscsi
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
      zvolCompression:
      zvolDedup:
      zvolEnableReservation: false
      zvolBlocksize:
    iscsi:
      targetPortal: "CHANGE-ME" # <----
      targetPortals: []
      interface:
      namePrefix: csi-
      nameSuffix: "-cluster"
      targetGroups:
        - targetGroupPortalGroup: "CHANGE-ME" # <----
          targetGroupInitiatorGroup: "CHANGE-ME" # <----
          targetGroupAuthType: None
          targetGroupAuthGroup:
      extentInsecureTpc: true
      extentXenCompat: false
      extentDisablePhysicalBlocksize: true
      extentBlocksize: 512
      extentRpm: "SSD"
      extentAvailThreshold: 0
EOF
