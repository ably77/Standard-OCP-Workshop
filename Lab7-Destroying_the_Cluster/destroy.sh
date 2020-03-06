#!/bin/bash

CLUSTER_NAME=ly-demo

./openshift-install_4.2.20 destroy cluster --dir=$HOME/Desktop/${CLUSTER_NAME} --log-level debug

echo
echo END.
echo

read -p "Cluster gone? Remove the installer directory? (y/n) " -n1 -s c
if [ "$c" = "y" ]; then
        echo yes

rm -rf $HOME/Desktop/${CLUSTER_NAME}

fi
