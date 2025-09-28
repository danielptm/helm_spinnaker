## Requirements
1. Docker desktop or minikube is installed
2. kubectl is installed
3. helm cli is installed


## Artifact hub
https://artifacthub.io/

## Useful commands
`helm lint <path/to/charts>`
`helm install <release-name> <path/to/charts/`
`helm uninstall <release-name>`
`helm template <folder/with/templates>`
`helm dependency update <charts/folder>`
`helm dependency build <charts/folder>`

## Jenkins setup

Get password
`printf $(kubectl get secret --namespace helm-spinnaker dpt-cloud-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo`

Run 
`kubectl -n helm-spinnaker port-forward dpt-cloud-jenkins-0 8080:8080`
user: admin



## Elastic setup
Get password
`kubectl get secret elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'`

Run
`kubectl port-forward service/dpt-cloud-eck-kibana-kb-http 8000:5601 -n helm-spinnaker`
default user:elastic

configured user:
user: dpt
pw: hello!234




See ELK: https://localhost:8000/app/home#/
