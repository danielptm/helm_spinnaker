echo 'installing...'
kubectl config set-context --current --namespace=helm-spinnaker

helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace
helm install elastic-operator-crds elastic/eck-operator-crds


helm  repo add elastic https://helm.elastic.co
helm repo add jenkins https://charts.jenkins.io
helm  repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

helm dependency build charts
sleep 2
helm install dpt charts
echo '**'
echo 'Jenkins user: admin'
echo 'Jenkins password'
sleep 2
printf $(kubectl get secret --namespace helm-spinnaker dpt-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
echo ''-spinnaker
echo 'ELK user: elastic'
echo 'ELK password'
kubectl get secret elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'
echo ''
echo 'See ELK: https://localhost:8000'
echo 'See Jenkins: http://localhost:8080'