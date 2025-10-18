echo 'un-installing...'
kubectl config set-context --current --namespace=helm-spinnaker
kubectl delete namespace elastic-system
helm uninstall dpt
helm uninstall my-eck-operator-crds
kubectl delete crd --all