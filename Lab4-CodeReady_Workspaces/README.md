# Demonstrating Codeready Workspaces
By default, this demo will deploy Openshift Codeready Workspaces as well as a pre-configured workspace with all of the repositories from this demo to work on. You can also connect the IDE to your own github account so that if you make any changes to the repos you can make push/pull requests to the repo. This is a very powerful feature because it allows companies to remove the need to develop on a local machine first. This opens up many opportunities for efficiency and productivity increases because development is created and tested on the same platform that it is run on. It also adds a layer of security for large organizations that want to protect their IP.

The first step will be to register a new user, fill in the form with any information that you desire and login to the user that you create.

![](https://github.com/ably77/strimzi-openshift-demo/blob/master/resources/codeready1.png)

### Edit workspace to own forks
Once the Codeready Workspace is complete, we will need to edit the workspace to work with our forks. Select the yellow triangle at the top left --> Workspaces

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready2.png)

Select configure workspace

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready3.png)

Modify the source locations of the repos below to your own forks
- https://github.com/ably77/openshift-testbed-argo-iotdemo
- https://github.com/ably77/spring-rest

Click Stop and then Open to restart the codeready workspaces with your changes

### Connect to kubernetes-api on codeready workspace CLI for cluster-admin privileges
```
oc login -u standard -p <OMITTED> --insecure-skip-tls-verify=true --server https://api.<CLUSTER_NAME>.<CLUSTER_DOMAIN>:6443
```
