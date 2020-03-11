# Lab 3 - Deploy a Spring Boot Tekton Pipeline with Git Push Webhook Trigger

In this lab we will show a Spring Boot pipeline example using Tekton Pipelines where any `git push` to the forked repo will trigger a pipeline build.

## Prerequisites

### Create a Github Personal Access Token
- https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token

Token Details
```
Name: tekton-openshift

Permission requirements for your Token:
- public_repo
- admin:repo_hook
```

### Install tkn CLI

Install the latest tkn CLI at the link here: https://github.com/tektoncd/cli

For MacOS X Users:
```
brew tap tektoncd/tools
brew install tektoncd/tools/tektoncd-cli
```
- Or by the [released tarball](https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Darwin_x86_64.tar.gz):

```
# Get the tar.xz
curl -LO https://github.com/tektoncd/cli/releases/download/v0.8.0/tkn_0.8.0_Darwin_x86_64.tar.gz
# Extract tkn to your PATH (e.g. /usr/local/bin)
sudo tar xvzf tkn_0.8.0_Darwin_x86_64.tar.gz -C /usr/local/bin tkn
```

### Fork the spring-rest repo
Fork the repo here: https://github.com/redhat-cop/spring-rest

You will need this to push changes so you can instantiate your pipeline

## Deploying a Springboot Pipeline

### Navigate to the tekton/springboot-tekton directory
```
cd tekton/springboot-tekton
```

### Variables
The script below will run and ask for a few variables, please have these readily available
- CLUSTER_NAME
- CLUSTER_DOMAIN
- GITHUB_USERNAME
- GITHUB_ORG (same as username if no org exists)
- GITHUB_TOKEN

### Deploy Pipeline
```
./runme.sh
```

### Clone your forked spring-rest repo

In a new tab, clone your forked spring-rest repo. You will need this later to push changes to
```
git clone https://github.com/${GITHUB_USERNAME}/spring-rest
```

### Navigate to spring-rest directory
```
cd spring-rest
```

### Instantiate Pipeline with a Git Commit
In your forked spring-rest repo, deliver an empty commit with the command below:
```
git commit -m "empty-commit" --allow-empty && git push origin master
```

### Follow Pipeline logs through CLI:
```
tkn pipeline logs -f
```

### In the Administrators View

Navigate to your Workloads --> Pods section and select the basic-spring-boot-build namespace. Here you should see your pipeline pods

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun7.png)

(4.3 ONLY) - Scroll down to the Pipeline --> PipelineRun section of your Openshift Administrators view:

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun1.png)

### Take a look at Developer UI

Switch to the Openshift Developer view and select Pipelines --> Pipeline Runs

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun2.png)

Click on Topology and once the pipeline completes you can reach your route

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun3.png)

### Open the UI

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/springboot1.png)


### curl the springboot website for a Hello World response
You can curl the springboot website at the `/v1/greeting` endpoint
```
curl basic-spring-boot-basic-spring-boot-build.apps.${CLUSTER_NAME}.${CLUSTER_DOMAIN}/v1/greeting
```
