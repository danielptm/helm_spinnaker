echo 'un-installing...'
helm uninstall dpt
helm uninstall my-eck-operator-crds
kubectl delete --all service -n elastic-system
kubectl delete --all pod -n elastic-system
kubectl delete --all statefulset -n elastic-system
kubectl delete namespace elastic-system
kubectl delete crd --all