# Demonstrating Codeready Workspaces
By default, this demo will deploy Openshift Codeready Workspaces as well as a pre-configured workspace with all of the repositories from this demo to work on. You can also connect the IDE to your own github account so that if you make any changes to the repos you can make push/pull requests to the repo. This is a very powerful feature because it allows companies to remove the need to develop on a local machine first. This opens up many opportunities for efficiency and productivity increases because development is created and tested on the same platform that it is run on. It also adds a layer of security for large organizations that want to protect their IP.

The first step will be to register a new user, fill in the form with any information that you desire and login to the user that you create.

![](https://github.com/ably77/strimzi-openshift-demo/blob/master/resources/codeready1.png)

### Fork the following repositories
- https://github.com/ably77/openshift-testbed-argo-iotdemo
- https://github.com/ably77/openshift-testbed-argo-voteapp-pipeline (you will need this for Lab 5)

### Edit workspace to own forks
Once the Codeready Workspace is complete, we will need to edit the workspace to work with our forks. Select the yellow triangle at the top left --> Workspaces

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready2.png)

Select configure workspace

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready3.png)

### Modify the devfile source locations
Modify the source locations of the repos below to your own forks
- https://github.com/ably77/openshift-testbed-argo-iotdemo
- https://github.com/ably77/openshift-testbed-argo-voteapp-pipeline

Click Stop and then Open to restart the codeready workspaces with your changes

## Demonstrating the IoT Demo and Configuration Management using argoCD + CodeReady
By default, the demo will deploy an example IoT Temperature Sensors Demo using ArgoCD based on ![this repo](https://github.com/ably77/iot-argocd). This demo will deploy a consumer facing portal that collects temperature data from simulated IoT devices and processes them.

![](https://github.com/ably77/strimzi-openshift-demo/blob/master/resources/iot1.png)

This demo creates a couple of topics. The first one named `iot-temperature` is used by the device simulator for sending temperature values and by the stream application for getting such values and processing them. The second one is the `iot-temperature-max` topic where the stream application puts the max temperature value processed in the specified time window that is then displayed in real-time on the consumer facing dashboard in the gauges charts as well as the log of incoming messages.

![](https://github.com/ably77/strimzi-openshift-demo/blob/master/resources/iot2.png)

### Auto-sync configuration changes with argocd
Navigate to the openshift-testbed-argo-iotdemo directory --> device.yaml. Change replicas from 1 --> 15

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready4.png)

Select git on the left column and commit the change. Select the check to commit and optionally add a message like "update to 15".

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready5.png)

Push your changes and enter in your Github credentials following to complete the push

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready6.png)

#### Visualize in argoCD
Navigate to the argoCD UI

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/argocd1.png)

Select your openshift-testbed-argo-iotdemo tile to visualize the app. Wait for it to automatically sync or force a manual refresh

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/argocd2.png)

#### Visualize in the iot dashboard app

Switch to the Developer view and select Topology. Use the namespace iot-dashboard

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/iotdashboard2.png)

Open the iot dashboard route

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/iotdashboard1.png)

#### Visualize in Grafana
In the Developer view Topology you can also select the grafana-deployment route to see grafana dashboards that ship with strimzi.
- Kafka Dashboard
- Kafka Exporter Dashboard
- Zookeeper Dashboard

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/grafana1.png)

![](https://github.com/ably77/strimzi-openshift-demo/blob/master/resources/grafana1.png)
