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

Edit machine set replica from 1 to 2
```
oc edit machinesets -n openshift-machine-api <MACHINE_SET_NAME>
```

Edit should look similar to below:
```
ApiVersion: machine.openshift.io/v1beta1
kind: MachineSet
metadata:
  creationTimestamp: "2020-03-05T14:51:09Z"
  generation: 1

<...>

spec:
  replicas: 1

<...>
```


### Upgrading your Cluster
