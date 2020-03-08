#!/bin/bash

htpasswd_path="$HOME/Desktop/Standard-OCP-Workshop/Lab1.2-Cluster_Installation_AWS/auth/users.htpasswd"

oc create secret generic standard-user-secret --from-file=htpasswd=${htpasswd_path} -n openshift-config
