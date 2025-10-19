echo 'un-installing...'
kubectl config set-context --current --namespace=helm-spinnaker
kubectl delete namespace elastic-system
kubectl delete crd --all
helm repo remove elastic bitnami jenkins
helm uninstall dpt
