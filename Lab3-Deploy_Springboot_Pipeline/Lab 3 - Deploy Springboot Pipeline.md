# Lab 3 - Deploying a Springboot pipeline

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

Change into the tekton/springboot-tekton directory
```
cd tekton/springboot-tekton
```

### Create a GitHub Web Token
- https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token

Token Details
```
Name: tekton-openshift

Permission requirements for your Token:
- public_repo
- admin:repo_hook
```

### Create Webhook Secret
You will need to modify the file `github-webhooks/wh-webhook-secret.yaml` to include your github personal access token
```
apiVersion: v1
kind: Secret
metadata:
  name: webhook-secret
stringData:
  #https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token
  token: <insert github personal access token here>
  secret: random-string-data
```

### Fork the spring-rest repo
Fork the repo here: https://github.com/redhat-cop/spring-rest

You will need this to push changes so you can instantiate your pipeline

### Clone your forked spring-rest repo
```
git clone https://github.com/<GITHUB_USER>/spring-rest
```


### Modify the webhook taskrun to your Github
Modify the following parameters in the `github-webhooks/wh-create-spring-repo-webhook-run.yaml`
- GitHubOrg
- GitHubUser
- ExternalDomain

The output should look similar to below but with your specific parameters
```
inputs:
    params:
      # your github org - same as user if there is no org
    - name: GitHubOrg
      value: "ably77"
      # your github user
    - name: GitHubUser
      value: "ably77"
    - name: GitHubRepo
      value: "spring-rest"
    - name: GitHubSecretName
      value: webhook-secret
    - name: GitHubAccessTokenKey
      value: token
    - name: GitHubSecretStringKey
      value: secret
      # external domain for your webhook listener route, replace <CLUSTER_NAME> and <CLUSTER_DOMAIN>
    - name: ExternalDomain
      #value: http://spring-boot-eventlistener-basic-spring-boot-build.apps.<CLUSTER_NAME>.<CLUSTER_DOMAIN>
      value: http://springboot-eventlistener-basic-spring-boot-build.apps.ly-demo.openshiftaws.com
```

### Deploy Pipeline
```
./runme.sh
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

### Take a look at Developer UI
Scroll down to the PipelineRun section of your Openshift Administrators view:

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun1.png)

or

Switch to the Openshift Developer view and select Pipelines

![](https://github.com/ably77/Standard-OCP-Workshop/blob/master/resources/pipelinerun2.png)
