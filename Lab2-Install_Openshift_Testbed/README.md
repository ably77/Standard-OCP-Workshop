# Lab 2 - Installing Openshift-testbed

### Verify oc connectivity

To install Openshift-testbed first make sure you are connected to your cluster to a user with cluster-admin privileges
```
oc whoami
```

If the `oc` command above fails, connect to your cluster using the instructions in Lab 1. Note that if you're using the EXPORT kubeconfig method that every tab requires you to run the EXPORT command.

### Install ArgoCLI
To deploy openshift-testbed you will need the argoCLI - https://github.com/argoproj/argo-cd/blob/master/docs/cli_installation.md

Install with Homebrew
```
brew tap argoproj/tap
brew install argoproj/tap/argocd
```

## Installation

### Clone the repo
```
git clone https://github.com/ably77/openshift-testbed $HOME/Desktop/openshift-testbed
```

Change directory into openshift-testbed
```
cd $HOME/Desktop/openshift-testbed
```

### Fork the following repositories
Fork the following repositories to your own GitHub account. We will be pushing changes to these repos in future labs
- https://github.com/ably77/openshift-testbed-argo-iotdemo


### Set up the correct script and YAML parameters

#### Set your github username as a variable
```
GITHUB_USERNAME=ably77
```

#### Modify your argocd install script to point at newly forked repositories
```
sed -e "s/<GITHUB_USERNAME>/${GITHUB_USERNAME}/g" $HOME/Desktop/Standard-OCP-Workshop/Lab2-Install_Openshift_Testbed/argocd.runme.sh.template > $HOME/Desktop/openshift-testbed/argocd/runme.sh && chmod +x $HOME/Desktop/openshift-testbed/argocd/runme.sh
```

#### Optional Verification: Take look at your changed file
```
$ cat $HOME/Desktop/openshift-testbed/argocd/runme.sh
#!/bin/bash
<...>

# commonly forked
repo1_url="https://github.com/<YOUR_GITHUB_USERNAME>/openshift-testbed-argo-iotdemo"
```

#### Modify your argocd iot demo application to point at newly forked repositories
```
sed -e "s/<GITHUB_USERNAME>/${GITHUB_USERNAME}/g" $HOME/Desktop/Standard-OCP-Workshop/Lab2-Install_Openshift_Testbed/openshift-testbed-argo-iotdemo.yaml.template > $HOME/Desktop/openshift-testbed/argocd/apps/2/openshift-testbed-argo-iotdemo.yaml
```

#### Optional Verification: Take a look at your changed file
```
% cat $HOME/Desktop/openshift-testbed/argocd/apps/2/openshift-testbed-argo-iotdemo.yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
<...>
spec:
  project: main
  source:
    # comment out below if in workshop
    repoURL: https://github.com/ably77/openshift-testbed-argo-iotdemo
    # for use with workshops, uncomment below and replace <YOUR_GITHUB_USER_HERE>
    #repoURL: https://github.com/<YOUR_GITHUB_USER_HERE>/openshift-testbed-argo-iotdemo
    targetRevision: HEAD
    path: .
<...>
```

## Installing openshift-testbed

Now you're ready to Deploy openshift-testbed
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

## Complete

The output of the script should result in several tabs being opened
- argoCD UI
- Grafana UI
- CodeReady Workspaces UI
- IoT Demo Application Dashboard

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/argo1.png)

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/iotdashboard1.png)
