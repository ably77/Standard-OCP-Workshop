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

Modify your install-config.yaml with your appropriate parameters with your text editor of choice
- {"DOMAIN_NAME"}
- {"CLUSTER_NAME"}
- {"RESOURCE_GROUP_NAME"}
- "{PULL_SECRET}"
- {"SSH_PUB_KEY"}

```
vim install-config.yaml
```

Run the Install script to deploy your OCP cluster
```
./install.sh
```
