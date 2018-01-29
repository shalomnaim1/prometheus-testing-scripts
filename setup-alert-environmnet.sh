#!/bin/bash

acceptance=""

echo "Are you sure you want to setup promethues? [Y/n]"
read acceptance

while [ "$acceptance" != "Y" ] && [ "$acceptance" != "n" ]
do

	echo "Wrong input was deletectd, use only Y or n"
	echo

	echo "Are you sure you want to setup promethues? [Y/n]"
	read acceptance
done

if [ "$acceptance" = "Y" ]
then
oc project default > /dev/null

# Cheack if prometheus-testing not exist
if [ `oc get project | grep -c prometheus-testing` -ne 1 ]
then
	oc create namespace prometheus-testing
fi

oc project prometheus-testing

oc new-app https://github.com/openshift/ruby-hello-world.git
oc scale dc ruby-hello-world --replicas=1

echo
echo
echo "To change pod count run oc scale dc ruby-hello-world --replicas=##"

fi
