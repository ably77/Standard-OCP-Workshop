# Lab 1 - Installing OCP on Azure

Download the latest Openshift installer (4.3.2) and `oc` CLI
```
https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.2/
```

To start this lab, clone this repo to your desktop:
```
git clone https://github.com/ably77/Standard-OCP-Workshop $HOME/Desktop/Standard-OCP-Workshop
```

Change directory into Lab1
```
cd $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation
```

Move the Openshift Installer into the lab 1 directory
```
mv </path/to/openshift/installer/> <<CLUSTER_PATH>/Standard-OCP-Workshop/Lab1-Cluster_Installation/openshift-install_4.3.2>
```

Modify your install-config.yaml with your appropriate parameters with your text editor of choice
- {"DOMAIN_NAME"}
- {"CLUSTER_NAME"}
- {"RESOURCE_GROUP_NAME"}
- "{PULL_SECRET}"
- {"SSH_PUB_KEY"}

```
vim install-config.yaml
```

Modify the top variables in the install.sh script to the same variables above
```
#!/bin/bash

CLUSTER_NAME="ly-demo2"
DOMAIN_NAME="openshiftaws.com"
```

Run the Install script to deploy your OCP cluster
```
./install.sh
```
