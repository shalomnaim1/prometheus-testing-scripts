#!/bin/bash

echo "removing prometheus data from NFS"
rm -rf /exports/prometheus/data/

echo "Restarting Prometheus pod"
oc delete pod prometheus-0 -n openshift-metrics


echo "Waiting for pod to raise"
while [ `oc get pods -n openshift-metrics | grep -c Running` -ne 1 ]
do 
	oc get pods -n openshift-metrics
        sleep 3
	echo
        echo
 done

echo "Prometheus is up and running"
oc get pods -n openshift-metrics
