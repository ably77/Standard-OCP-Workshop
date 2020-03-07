# Destroying the Cluster

Navigate to the installer directory
```
cd $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation
```

Set your cluster name variable, for example
```
CLUSTER_NAME=ocpdemo
```

Destroy the cluster
```
./openshift-install_4.2.20 destroy cluster --dir=$HOME/Desktop/${CLUSTER_NAME} --log-level debug
```

Once complete, remove cluster directory
```
rm -rf $HOME/Desktop/${CLUSTER_NAME}
```

#### Best Practices
It is a best practice to uninstall and remove the directory completely when using the same installation path, this helps to avoid orphaned resources in situations where there are installer errors.
