# Scaling and Upgrading your Cluster

### Scaling using the UI

To scale your cluster with the UI, simply navigate to the Compute --> MachineSets section in your Administrators UI

(Insert Pic Here)

Select a machineSet and scale it from 1 to 2

(Insert Pic Here)

Navigate to the Nodes/Machine view to see your new machine being created

(Insert Pic Here)

### Scaling using the CLI
Get machine sets
```
oc get machinesets -n openshift-machine-api
```


### Upgrading your Cluster
