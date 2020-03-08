#!/bin/bash

CLUSTER_NAME="azure-test"
CLUSTER_DOMAIN="ly-azurecluster.com"
# correct installer version must be in directory
CLUSTER_VERSION="4.2.20"


### clear kubeconfig
rm -rf ~/.kube/config

### create cluster directory
mkdir $HOME/Desktop/${CLUSTER_NAME}

### copy ignition into cluster directory
cp $HOME/Desktop/Standard-OCP-Workshop/Lab1.1-Cluster_Installation_Azure/install-config.yaml $HOME/Desktop/${CLUSTER_NAME}

### create cluster
./openshift-install_${CLUSTER_VERSION} create cluster --dir=$HOME/Desktop/${CLUSTER_NAME} --log-level debug

### open console route
open https://console-openshift-console.apps.${CLUSTER_NAME}.${CLUSTER_DOMAIN}

### setup ally user and login
export KUBECONFIG=$HOME/Desktop/${CLUSTER_NAME}/auth/kubeconfig

oc create -f auth/cluster_role_binding.yaml
./auth/create_secret.sh
oc apply -f auth/cr.yaml
