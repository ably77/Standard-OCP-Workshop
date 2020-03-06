# Lab 1 - Installing OCP on Azure

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

Rename the install-config.yaml
```
mv install-config-scrubbed.yaml install-config.yaml
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

CLUSTER_NAME="ly-demo"
DOMAIN_NAME="openshiftaws.com"
```

Run the Install script to deploy your OCP cluster
```
./install.sh
```
