# Lab 2 - Installing Openshift-testbed

To install Openshift-testbed first make sure you are connected to your cluster:
```
export KUBECONFIG=${CLUSTER_PATH}/${CLUSTER_NAME}/auth/kubeconfig
```

To verify connectivity, just run a command such as `oc get nodes`. Output should look like below
```
$ oc get nodes
NAME                           STATUS   ROLES    AGE     VERSION
ip-10-0-133-249.ec2.internal   Ready    master   7h59m   v1.16.2
ip-10-0-140-76.ec2.internal    Ready    worker   7h46m   v1.16.2
ip-10-0-154-31.ec2.internal    Ready    worker   7h46m   v1.16.2
```

Now you can clone the openshift-testbed repo
```
git clone https://github.com/ably77/openshift-testbed $HOME/Desktop/openshift-testbed
```

Change directory into openshift-testbed
```
cd $HOME/Desktop/openshift-testbed
```

Fork the following repositories to your own GitHub account:
- https://github.com/ably77/openshift-testbed-argo-iotdemo
- https://github.com/ably77/openshift-testbed-argo-codeready
- https://github.com/ably77/openshift-testbed-argo-voteapp-pipeline
- https://github.com/ably77/openshift-testbed-argo-voteapp
- https://github.com/ably77/openshift-testbed-argo-springbootpipeline

Deploy openshift-testbed
```
./runme.sh
```

### Script Details
This script will:
- Deploy necessary demo CRDs
- Deploy and argoCD
- Configure argoCD to demo repositories
- Open ArgoCD Route
- Deploy the Strimzi Kafka Operator
- Deploy an ephemeral kafka cluster with 3 broker nodes and 3 zookeeper nodes
- Create three Kafka topics (my-topic1, my-topic2, my-topic3)
- Deploy Prometheus
- Deploy the Integr8ly Grafana Operator
- Add the Prometheus Datasource to Grafana
- Add Strimzi Kafka, Kafka Exporter, and Zookeeper Dashboards
- Deploy the IoT Temperature Sensors Demo using ArgoCD
- Open Grafana Route
- Open IoT Temperature Sensors Demo app route
- Deploy sample cronJob1 and cronJob2
- Deploy CodeReady Workspaces
- Create an Eclipse Che cluster with this demo's repositories
- Deploy Tekton Pipelines Operator using ArgoCD
