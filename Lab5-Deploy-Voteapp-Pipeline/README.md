# Lab 5 - Configuration Management Using ArgoCD + Tekton Pipelines with CodeReady Workspaces

In this lab we will show a vote app pipeline example where a pipeline is instantiated by a commit of a PipelineRun manifest.

An argocd app of this pipeline has been deployed

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/argocd3.png)

Since this app is governed by argoCD, deploying a PipelineRun that is not through GitOps methodology will trigger a pipeline that will quickly terminate. This methodology may be used for environments that require more security posture and control

### In your CodeReady Workspace

#### Connect to kubernetes-api on codeready workspace CLI for cluster-admin privileges
```
oc login -u <OMITTED> -p <OMITTED> --insecure-skip-tls-verify=true --server https://api.<CLUSTER_NAME>.<CLUSTER_DOMAIN>:6443
```

#### Navigate to openshift-testbed
```
cd openshift-testbed
```

### Manually deploy a PipelineRun that will Fail

Create a PipelineRun
```
oc create -f tekton/pipelines-tutorial/pipelinerun/build-and-deploy-pipelinerun.yaml
```

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun4.png)

You will see in the Pipeline Runs tab in the UI that these manual deploys will fail. Because a manual deploy will trigger a sync back to the GitOps state, any PipelineRun that is created will automatically be terminated, causing it to fail

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun5.png)

### Triggering the pipeline through GitOps

Navigate to the openshift-testbed-argo-voteapp-pipeline repo and select the voteapp-pipelinerun.yaml. Change the PipelineRun name to v2

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/codeready7.png)

### Commit and Push
Use the UI or CLI to initiate a `git commit` and `git push` to the repo

### Visualize in ArgoCD
In the argocd UI you will see the run initiate

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/argocd4.png)

Back in the Openshift UI you can see that the PipelineRun is progressing

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun6.png)

### Visit the Cat/Dog Vote Application
In the Developer View you can reach your application route easily through the Topology screen

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/voteapp1.png)

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/voteapp2.png)

Notice the Container ID, if you re-run the pipeline and watch Openshift Events, Openshift Workload - Pods, argoCD UI, or click around on the website you will notice that pipelines run in the background and handle rolling deployments gracefully.

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun7.png)
