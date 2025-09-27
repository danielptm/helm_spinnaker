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
Run 
`kubectl -n helm-spinnaker port-forward dpt-cloud-jenkins-0 8080:8080`
user: admin
default pw: LLLirvqoJ8unouQ9ZZzTAc

See jenkins: http://localhost:8080/

## Elastic setup
Run
`kubectl port-forward service/dpt-cloud-eck-kibana-kb-http 8000:5601 -n helm-spinnaker`

Run to get the default password
`kubectl get secret elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}'`
When I ran it was:
user: elastic
pw: 11m0yXM3iN9y6owT3vNUX068

See ELK: https://localhost:8000/app/home#/