# Getting started with MongoDB Atlas K8s Operator

This is a short article on how to get started with the MongoDB Atlas Kubernetes Operator

## Prerequisites
- VirtualBox.
- Vagrant
- Virtualization enabled on your system (if using Windows).
- MongoDB Atlas Cluster

## Installing VirtualBox

In order to install VirtualBox, use this link:

https://www.virtualbox.org/wiki/Downloads

## Installing Vagrant

Vagrant offers install options for all operating systems:

https://www.vagrantup.com/downloads.html

There are installers for Mac, Windows, Debian and CentOS.

If you have any other Linux Distribution, you can choose the `Linux` tab and download the binary.

After that, you can go to your Downloads folder and run ```sudo mv vagrant /usr/local/bin/``` to put
it somewhere where your terminal can find it (this step is necessary only if you are using the binary from the `Linux` tab).

After installing, commands like `vagrant version` should work from anywhere.

For Windows we recommend that you use Power Shell, instead of cmd.

## Getting Started

This Local Dev Environment is created using Vagrant and aims to offer a one-click setup experience to create a test environment.

The VM contains a single node Kubernetes cluster with DNS and Metallb deployed.

The steps to creating the VM for the local DEV environment are:
1. Run `vagrant up` in the same folder as the Vagrant file in this repo.
2. Once the machine is running, run `vagrant ssh` to enter it.

To stop the VM run `vagrant halt` inside the vagrant folder. To start a VM from a `Stopped` or `Aborted` state, use `vagrant up`.


### MongoDB Atlas Operator

To install the MongoDB atlas operator run
```kubectl apply -f https://raw.githubusercontent.com/mongodb/mongodb-atlas-kubernetes/main/deploy/all-in-one.yaml``` from inside of the vagrant VM.

This will pull the latest version of the MongoDB Atlas Operator and deploy it to the Kubernetes cluster.

### MongoDB Atlas
The MongoDB Atlas Kubernetes operator allow for provisioning and management off MongoDB Atlas cluster from within your kubernetes environment. To be able to manage MongoDB Atlas resources you first need to create an Atlas account. This can be done using the following link. https://www.mongodb.com/cloud/atlas/signup   
Once your account is setup you will need to acquire three things:
- Org ID
- Public API key
- Private API Key

To create your API keys follow the steps on this link: https://www.mongodb.com/docs/atlas/configure-api-access/#std-label-create-org-api-key

The Org ID can be found clicking on the `Cogs` on the right side of your Org name in the upper left corner in the Atlas Console.

Once you have collected the required information you are ready to start deploying resources.

In the [k8s-deployments](./k8s-deployments) folder you will find numbered YAML files. The number depicts in which order to apply the configuration.

- [1_atlas-namespace.yaml](./k8s-deployments/1_atlas-namespace.yaml) Create a namespace for your resources
- [2_atlas-secrets.yaml](./k8s-deployments/2_atlas-secrets.yaml) Create required secrets,   
this is where you will configure `Org ID`, `Public API Key`, `Private API Key` and a password for a db-user.
- [3_atlas-project.yaml](./k8s-deployments/3_atlas-project.yaml) Create or link a Atlas Project. The MongoDB Atlas Cluster will be created in this project. You will need to add your own `Project Name`
- [4_atlas-cluster.yaml](./k8s-deployments/4_atlas-cluster.yaml) This is the configuration of the actual cluster.
- [5_atlas-db-user.yaml](./k8s-deployments/5_atlas-db-user.yaml) This will configure a db-user to allow applications to access the databases. Once the `AtlasDatabaseUser` resource is created, the MongoDB Atlas Kubernetes Operator will create a secret containing the connection string to connect to the newly created cluster.
The format for the secret name is: projectname-clustername-dbuser



## Examples
The [k8s-deployments](./k8s-deployments) folder contains example yaml configurations for deploying an Atlas Cluster

The [commands](./commands) file contains some handy commands for checking status and getting the connection string.


For more information on working with the MongoDB Atlas Operator read the main documentation.

https://github.com/mongodb/mongodb-atlas-kubernetes   
https://www.mongodb.com/docs/atlas/atlas-operator/


