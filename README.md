# Standard-OCP-Workshop

Extra Commands:

### Connect to kubernetes-api on codeready workspace CLI for cluster-admin privileges
```
oc login -u <OMITTED> -p <OMITTED> --insecure-skip-tls-verify=true --server https://api.<CLUSTER_NAME>.<CLUSTER_DOMAIN>:6443
```
