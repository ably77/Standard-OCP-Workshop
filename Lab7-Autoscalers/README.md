# Applying Autoscaling
REF: (https://docs.openshift.com/container-platform/4.3/machine_management/applying-autoscaling.html)

Applying autoscaling to an OpenShift Container Platform cluster involves deploying a ClusterAutoscaler and then deploying MachineAutoscalers for each Machine type in your cluster.

You must deploy a MachineAutoscaler for the ClusterAutoscaler to scale your machines. The ClusterAutoscaler uses the annotations on MachineSets that the MachineAutoscaler sets to determine the resources that it can scale. If you define a ClusterAutoscaler without also defining MachineAutoscalers, the ClusterAutoscaler will never scale your cluster.

## About the ClusterAutoscaler
The ClusterAutoscaler adjusts the size of an OpenShift Container Platform cluster to meet its current deployment needs. It uses declarative, Kubernetes-style arguments to provide infrastructure management that does not rely on objects of a specific cloud provider. The ClusterAutoscaler has a cluster scope, and is not associated with a particular namespace.

The ClusterAutoscaler increases the size of the cluster when there are pods that failed to schedule on any of the current nodes due to insufficient resources or when another node is necessary to meet deployment needs. The ClusterAutoscaler does not increase the cluster resources beyond the limits that you specify.

### Verifying the ClusterAutoscaler

#### View ClusterAutoscaler being deployed by argoCD
This demo automatically deploys a `default` ClusterAutoscaler as a part of the `openshift-testbed-argo-shared` repository. You can see the details of the autoscaler here: (https://github.com/ably77/openshift-testbed-argo-shared/blob/master/clusterautoscaler.yaml)

#### View ClusterAutoscaler with CLI
```
oc get clusterautoscaler default -o yaml
```

#### View ClusterAutoscaler in the UI
In the Administrator view, navigate to Administration --> Cluster Settings and select ClusterAutoscaler

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/autoscaler1.png)

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/autoscaler2.png)


## About the MachineAutoscaler
The MachineAutoscaler adjusts the number of Machines in the MachineSets that you deploy in an OpenShift Container Platform cluster. You can scale both the default worker MachineSet and any other MachineSets that you create. The MachineAutoscaler makes more Machines when the cluster runs out of resources to support more deployments. Any changes to the values in MachineAutoscaler resources, such as the minimum or maximum number of instances, are immediately applied to the MachineSet they target.

### Creating MachineAutoscalers

Navigate to the autoscaling directory
```
cd autoscaling
```

Run the script to generate your MachineAutoscalers in the directory `generated_examples`
```
./runme.sh
```

#### Take a look at a MachineAutoscaler
You can see that the generated autoscaler sets a maximum MachineSet pool to 6 machines
```
% cat generated_examples/ocp-demo-xsjvp-worker-us-east-1a.yaml
apiVersion: "autoscaling.openshift.io/v1beta1"
kind: "MachineAutoscaler"
metadata:
  name: "ocp-demo-xsjvp-worker-us-east-1a"
  namespace: "openshift-machine-api"
spec:
  minReplicas: 1
  maxReplicas: 6
  scaleTargetRef:
    apiVersion: machine.openshift.io/v1beta1
    kind: MachineSet
    name: ocp-demo-xsjvp-worker-us-east-1a
```

### Deploy your MachineAutoscalers
```
oc create -f generated_examples/
```

### Verify that your MachineAutoscalers have been created

#### Using the CLI
```
oc get machineautoscalers
```

Output should look similar to below:
```
% oc get machineautoscalers -n openshift-machine-api
NAME                              REF KIND     REF NAME                          MIN   MAX   AGE
ly-demo-xsjvp-worker-us-east-1a   MachineSet   ly-demo-xsjvp-worker-us-east-1a   1     6     84s
ly-demo-xsjvp-worker-us-east-1b   MachineSet   ly-demo-xsjvp-worker-us-east-1b   1     6     84s
ly-demo-xsjvp-worker-us-east-1c   MachineSet   ly-demo-xsjvp-worker-us-east-1c   1     6     84s
ly-demo-xsjvp-worker-us-east-1d   MachineSet   ly-demo-xsjvp-worker-us-east-1d   1     6     84s
```

#### Using the UI
In the Administrator view, navigate to Compute --> Machine Autoscalers

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/autoscaler3.png)
