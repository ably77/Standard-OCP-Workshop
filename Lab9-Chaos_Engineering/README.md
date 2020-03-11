# Chaos Engineering - Demonstrating failure and Platform Resiliency w/ argoCD and GitOps

## About Chaos Engineering
Chaos engineering is the discipline of experimenting on a software system in production in order to build confidence in the system's capability to withstand turbulent and unexpected conditions.

The intent of Chaos Engineering is to move away from a development model that assumes no breakdowns to a model where breakdowns are considered to be inevitable. This mentality drives developers to consider built-in resilience to be an obligation rather than an option. By regularly "killing" random instances of a software service, it was possible to test a redundant architecture to verify that a server failure did not noticeably impact customers.

### About ArgoCD + GitOps
With argoCD and GitOps in place, we can start to play with some Chaos Engineering principles in `openshift-testbed`. As we have observed, ArgoCD is constantly monitoring for state changes between the cluster and GitHub. In a situation where random instances are killed, argoCD will automatically drive a sync back to desired state.

## Chaos Engineering using the argoCD UI
In the argoCD UI you can delete resources and watch them auto-heal. Lets test this with the `openshift-testbed-argo-iotdemo`. Navigate to the argoCD UI and select the application tile

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos1.png)

### Starting Simple - Chaos Engineering a Stateless service
Let's start with a simple example, destroying one of the stateless iot-demo simulation devices. Select any one of the `device-app` pods and click delete. You should immediately see the pod switch to `Terminating` state, and a new pod being created.

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos2.png)

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos3.png)

### Deleting the IoT Consumer Dashboard
For this example we will be destroying the consumer-app. This app only has a `replicaset: 1` so we would expect to see some downtime if this component went down. What you will see though, is that with argoCD and GitOps in place, this recovery is quick and requires no manual intervention.

#### Navigate to your IoT Temperature Sensors Dashboard
In a separate screen, navigate to the IoT Dashboard so you can see the affect on the UI in real-time

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/iotdashboard1.png)

#### In the argoCD UI
Following the same steps as above, delete the consumer-app deployment this time. You should immediately see many pods switch to `Terminating` state, and new pods being created.

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos4.png)

#### Back in the IoT Dashboard
You should see all of the devices clear and the app go down. Keep an eye on the argoCD UI for pods that are `Running`. Once in the correct state, verify that a refresh of the IoT Dashboard webpage should return back to desired state.

### More Complex - Chaos Engineering a Stateful service
In the argoCD UI, navigate to the `openshift-testbed-argo-kafka` application. For this demo we will start by deleting Zookeeper, the stateful key-value store for Kafka.

#### Delete Zookeeper
Following the same steps as above, delete the `my-cluster-zookeeper-` deployment this time. You should immediately see the pod switch to `Terminating` state, and new pod being created.

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos5.png)

#### IoT Dashboard
You should see in the IoT Dashboard UI that destroying one of the zookeeper back-end components should not have any affect to the viewer

#### Check the Openshift Events
In the Openshift UI, navigate to Home --> Events and select the namespace `myproject` you should see the specific scheduler events and related information on pod termination and re-creation

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos6.png)

### Delete a Kafka Broker
Following the same steps as above, delete the `my-cluster-kafka-` deployment this time. You should immediately see the pod switch to `Terminating` state, and new pod being created.

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/chaos7.png)

#### Observed Results
Taking a look at the iot-temperature topic (https://github.com/ably77/openshift-testbed-argo-iotdemo/blob/master/iot-temperature-topic.yml)
```
partitions: 1
replicas: 3
```

You may see the devices fall off of the IoT Dashboard (this depends whether the dashboard was consuming a replica on the deleted broker). Given that we have a replica on each broker, the consumer dashboard should re-map itself to another available partition.

### Discovering an issue through Chaos Engineering
Sometimes when killing the backend kafka components you may see the iot-consumer dashboard fails to re-map itself to another broker. This happens because the basic frontend app was not designed to capture this failure scenario. If this happens, you can see this error in the logs
```
% oc logs -n myproject consumer-app-<TAG>
```

Through Chaos Engineering you have discovered a bug!

#### Quick steps to remediate:
Not helping you fix the bug in the application code, but in order to get your consumer app to work again the easiest way would be to un-install and re-install the iot-demo

Remove the argoCD app
```
oc delete -f $HOME/Desktop/openshift-testbed/argocd/apps/2/openshift-testbed-argo-iotdemo.yaml
```

Create the argoCD app
```
oc create -f $HOME/Desktop/openshift-testbed/argocd/apps/2/openshift-testbed-argo-iotdemo.yaml
```

## Delete components using the CLI
You can run through all of the above examples by just deleting components using the `oc` client and watch the components in the UI react.

### Deleting Deployments
Get `myproject` namespace Deployments
```
oc get deployment -n myproject
```

Delete device-app pod:
```
oc delete deployment -n myproject device-app
```

Delete the consumer-app dashboard:
```
oc delete deployment -n myproject consumer-app
```

### Deleting Pods
Get `myproject` namespace Pods
```
oc get pods -n myproject
```

Delete Zookeeper:
```
oc delete pod -n myproject my-cluster-zookeeper-2
```

Delete Kafka Broker:
```
oc delete pod -n myproject my-cluster-kafka-1
```

## Review
Using ArgoCD + GitOps as well as `openshift-testbed` we have now started to explore the concept of Chaos Engineering. Keep playing around with destroying components to identify points of failure in your applications!
