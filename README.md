# Local Dev Environment

## Prerequisites
- VirtualBox.
- Vagrant
- Virtualization enabled on your system (if using Windows).

## Installing VirtualBox

In order to install VirtualBox, use this link:

https://www.virtualbox.org/wiki/Downloads

## Installing Vagrant

Vagrant offers install options for all operating systems as well:

https://www.vagrantup.com/downloads.html

There are installers for Mac, Windows, Debian and CentOS.

If you have any other Linux Distribution, you can choose the `Linux` tab and download the binary.

After that, you can go to your Downloads forlder and run `sudo mv vagrant /usr/local/bin/` to put
it somewhere where your terminal can find it (this step is necessary only if you are using the binary from the `Linux` tab).

After installing, commands like `vagrant version` should work from anywhere.

For Windows we recommend that you use Power Shell, instead of cmd.

## Getting Started

This Local Dev Environment is created using Vagrant and aims to offer a one-click setup experience to developers.

The steps to creating the VM for the local DEV environment are:
1. Run `vagrant up`.
2. Run `vagrant ssh`.

Install the MongoDB atlas operator run  
`kubectl apply -f https://raw.githubusercontent.com/mongodb/mongodb-atlas-kubernetes/main/deploy/all-in-one.yaml`


To stop the VM run `vagrant halt` inside the vagrant folder. To start a VM from a `Stopped` or `Aborted` state, use `vagrant up`.

For more information on working with the MongoDB Atlas Operator read the main documentation.

https://github.com/mongodb/mongodb-atlas-kubernetes
https://www.mongodb.com/docs/atlas/atlas-operator/

## Examples
The `k8s-deployments` folder contains example yaml configurations for deploying an Atlas Cluster
