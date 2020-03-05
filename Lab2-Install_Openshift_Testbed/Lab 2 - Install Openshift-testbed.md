# Lab 2 - Installing Openshift-testbed

To install Openshift-testbed first make sure you are connected to your cluster:
```
export KUBECONFIG=${CLUSTER_PATH}/${CLUSTER_NAME}/auth/kubeconfig
```

To verify connectivity, just run a command such as `oc get nodes`. Output should look like below
```
$ oc get nodes
NAME                           STATUS   ROLES    AGE     VERSION
ip-10-0-133-249.ec2.internal   Ready    master   7h59m   v1.16.2
ip-10-0-140-76.ec2.internal    Ready    worker   7h46m   v1.16.2
ip-10-0-154-31.ec2.internal    Ready    worker   7h46m   v1.16.2
```

Now you can clone the openshift-testbed repo
```
git clone https://github.com/ably77/openshift-testbed $HOME/Desktop/openshift-testbed
```

Change directory into openshift-testbed
```
cd $HOME/Desktop/openshift-testbed
```

Deploy openshift-testbed
```
./runme.sh
```
