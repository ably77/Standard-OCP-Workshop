# Destroying the Cluster

Navigate to the installer directory
```
cd $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation
```

Set your cluster name variable
```
CLUSTER_NAME=ly-demo
```

Destroy the cluster
```
./openshift-install_4.2.20 destroy cluster --dir=$HOME/Desktop/${CLUSTER_NAME} --log-level debug
```

Once complete, remove cluster directory
```
rm -rf $HOME/Desktop/${CLUSTER_NAME}
```
