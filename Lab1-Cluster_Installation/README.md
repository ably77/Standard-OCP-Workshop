# Lab 1 - Installing OCP on Azure

Download the Openshift installer (4.2.20) and `oc` CLI.
```
https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.3.2/
```

To extract the installer:
```
tar xvf <installation_program>.tar.gz
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
mv </path/to/openshift/installer/> $HOME/Desktop/Standard-OCP-Workshop/Lab1-Cluster_Installation/openshift-install_4.3.2
```

Rename the install-config.yaml
```
mv install-config-scrubbed.yaml install-config.yaml

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

CLUSTER_NAME="ly-demo"
DOMAIN_NAME="openshiftaws.com"
```

Run the Install script to deploy your OCP cluster
```
./install.sh
```
