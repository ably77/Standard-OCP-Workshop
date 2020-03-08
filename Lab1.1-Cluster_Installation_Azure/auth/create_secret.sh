#!/bin/bash

htpasswd_path="$HOME/Desktop/Standard-OCP-Workshop/Lab1.1-Cluster_Installation_Azure/auth/users.htpasswd"

oc create secret generic standard-user-secret --from-file=htpasswd=${htpasswd_path} -n openshift-config
