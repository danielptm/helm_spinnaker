#!/bin/bash



nohup kubectl -n helm-spinnaker port-forward dpt-jenkins-0 8080:8080 &
nohup kubectl port-forward service/dpt-eck-kibana-kb-http 8000:5601 -n helm-spinnaker &

echo 'Jenkins user: admin'
echo 'Jenkins password'
printf $(kubectl get secret --namespace helm-spinnaker dpt-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
echo ''
echo 'ELK user: elastic'
echo 'ELK password'
kubectl get secret elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'
echo ''
echo 'See ELK: https://localhost:8000/login?next=%2Fapp%2Fhome#/'
echo 'See Jenkins: http://localhost:8080/login?from=%2F'