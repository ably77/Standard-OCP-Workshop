# Lab 1 - Installing OCP on Azure

## Installing the `oc` client
Download the openshift-client from the site below:
```
https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.2.20/
```
Extract the compressed file and place it in a directory that is on your PATH.


Or if you're using Homebrew on MacOSX
```
brew install openshift-cli
```

## Using `oc`
The `oc` command is identical to `kubectl` in every way so you can use them interchangeably. `oc` does provide extra capabilities that `kubectl` does not have. This extra functionality is typically for administrative functions. For example you can explore the `oc adm` features:
```
$ oc adm
Administrative Commands

 Actions for administering an OpenShift cluster are exposed here.

Usage:
  oc adm [flags]

Cluster Management:
  upgrade                            Upgrade a cluster
  top                                Show usage statistics of resources on the server
  must-gather                        Launch a new instance of a pod for gathering debug information

Node Management:
  drain                              Drain node in preparation for maintenance
  cordon                             Mark node as unschedulable
  uncordon                           Mark node as schedulable
  taint                              Update the taints on one or more nodes
  node-logs                          Display and filter node logs

Security and Policy:
  new-project                        Create a new project
  policy                             Manage cluster authorization and security policy
  groups                             Manage groups
  certificate                        Approve or reject certificate requests
  pod-network                        Manage pod network

Maintenance:
  prune                              Remove older versions of resources from the server
  migrate                            Migrate data in the cluster

Configuration:
  create-kubeconfig                  Create a basic .kubeconfig file from client certs
  create-api-client-config           Create a config file for connecting to the server as a user
  create-bootstrap-project-template  Create a bootstrap project template
  create-bootstrap-policy-file       Create the default bootstrap policy
  create-login-template              Create a login template
  create-provider-selection-template Create a provider selection template
  create-error-template              Create an error page template

Other Commands:
  build-chain                        Output the inputs and dependencies of your builds
  completion                         Output shell completion code for the specified shell (bash or zsh)
  config                             Change configuration files for the client
  release                            Tools for managing the OpenShift release process
  verify-image-signature             Verify the image identity contained in the image signature
```

## Start Installation Lab

To start this lab, clone this repo to your desktop:
```
git clone https://github.com/ably77/Standard-OCP-Workshop $HOME/Desktop/Standard-OCP-Workshop
```

Download the Openshift installer (4.2.20) and `oc` CLI to your Desktop
```
https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.2.20/
```

To extract the installer
```
tar -C $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation/ -xvf $HOME/Desktop/openshift-install-mac-4.2.20.tar.gz
```

Change directory into Lab1
```
cd $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation
```

Rename the installer
```
mv openshift-install openshift-install_4.2.20
```


## Generating cluster install-config.yaml
- DOMAIN_NAME - A fully-qualified domain or subdomain name, such as example.com.
- CLUSTER_NAME - The name of your cluster
- RESOURCE_GROUP_NAME - The name of the resource group that contains the DNS zone for your base domain. (Azure only)
- PULL_SECRET - The pull secret that you obtained from the Pull Secret page on the Red Hat OpenShift Cluster Manager (try.openshift.com) site.

### If Deploying on Azure - Set the following variables
```
DOMAIN_NAME=
CLUSTER_NAME=
RESOURCE_GROUP_NAME=
PULL_SECRET=
```

### Azure - Generate your cluster install-config.yaml
```
sed -e "s/<DOMAIN_NAME>/${DOMAIN_NAME}/g" -e "s/<CLUSTER_NAME>/${CLUSTER_NAME}/g" -e "s/<RESOURCE_GROUP_NAME>/${RESOURCE_GROUP_NAME}/g" -e "s/<PULL_SECRET>/${PULL_SECRET}/g" install-config-azure.yaml.template > install-config.yaml
```

### If Deploying on AWS - Set the following variables
```
DOMAIN_NAME=
CLUSTER_NAME=
PULL_SECRET=
```

### AWS - Generate your cluster install-config.yaml
```
sed -e "s/<DOMAIN_NAME>/${DOMAIN_NAME}/g" -e "s/<CLUSTER_NAME>/${CLUSTER_NAME}/g" -e "s/<PULL_SECRET>/${PULL_SECRET}/g" install-config-aws.yaml.template > install-config.yaml
```

Optional - Not needed for lab:
You can optionally uncomment and provide the sshKey value that you use to access the machines in your cluster. This can be a common practice for production OpenShift Container Platform clusters on which you want to perform installation debugging or disaster recovery on, specify an SSH key that your ssh-agent process uses.
- <SSH_PUB_KEY>

### Verfication
Take this time to verify that the generated install-config.yaml parameters have been populated
```
cat install-config.yaml
```

### Create your install script
```
sed -e "s/<DOMAIN_NAME>/${DOMAIN_NAME}/g" -e "s/<CLUSTER_NAME>/${CLUSTER_NAME}/g" install.sh.template > install.sh && chmod +x install.sh
```

Run the Install script to deploy your OCP cluster
```
./install.sh
```

Once installed, you can export your kubeconfig to access your cluster
```
export KUBECONFIG=$HOME/Desktop/<CLUSTER_NAME>/auth/kubeconfig
```

Verify that your cluster is connected by running a command such as `oc get nodes`

This script will also set up a user/password login if you would prefer a user that is not kubeadmin but has cluster-admin privileges
```
oc login -u <OMITTED> -p <OMITTED> --insecure-skip-tls-verify=true --server https://api.<CLUSTER_NAME>.<CLUSTER_DOMAIN>:6443
```

Verify your user:
```
oc whoami
```

The installer output should display your console link, but if you lose that tab you can access the Openshift Console with the command below:
```
oc get routes -n openshift-console
```
