#!/bin/bash

CLUSTER_NAME="ly-demo2"
CLUSTER_PATH="$HOME/Desktop"
DOMAIN_NAME="openshiftaws.com"

### clear kubeconfig
rm -rf ~/.kube/config

### create cluster directory
mkdir ${CLUSTER_PATH}/${CLUSTER_NAME}

### copy ignition into cluster directory
cp ${CLUSTER_PATH}/Standard-OCP-Workshop/Lab1-Cluster_Installation/install-config.yaml ${CLUSTER_PATH}/${CLUSTER_NAME}

### create cluster
./openshift-install_4.3.2 create cluster --dir=${CLUSTER_PATH}/${CLUSTER_NAME} --log-level debug

### open console route
open https://console-openshift-console.apps.${CLUSTER_NAME}.${DOMAIN_NAME}

### export kubeconfig
export KUBECONFIG=${CLUSTER_PATH}/${CLUSTER_NAME}/auth/kubeconfig
