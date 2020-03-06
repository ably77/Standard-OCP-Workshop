#!/bin/bash

CLUSTER_NAME=ly-demo

./$HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation/openshift-install_4.2.20 destroy cluster --dir=$HOME/Desktop/${CLUSTER_NAME} --log-level debug

echo
echo END.
echo

read -p "Cluster gone? Remove the installer directory? (y/n) " -n1 -s c
if [ "$c" = "y" ]; then
        echo yes

rm -rf $HOME/Desktop/${CLUSTER_NAME}

fi
