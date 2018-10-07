# learning-kubernetes

Repo for learning how to use Kubernetes and Helm charts with the help of Kubernetes in Action book.

1. Create GKE project
1. `gcloud auth login`
1. `gcloud config set project <GCP PROJECT ID>`
1. Run `gcloud auth configure-docker`
1. Run `refresh.sh` to update docker image to google docker repository
1. Connect kubectl to your cluster w/ gcloud container
1. `kubectl create serviceaccount --namespace kube-system tiller`
1. `kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller`
1. `helm init --service-account tiller`
1. Install with `helm install --name test -f secrets.yml node-app-helm`

Try db connection:

1. Get pods `kubectl get po -o wide`
1. `kubectl port-forward <pod id> 8888:8888`
1. From another shell run `curl localhost:8888`

## Commands 

- After changes upgrade with `helm upgrade test -f secrets.yml ./node-app-helm` 
- Run tests with `helm test --cleanup test` 
- Delete chart with `helm delete test --purge` 
- See why pod initialization fails `kubectl describe po <pod id>` 
- List pods `kubectl get po` 

## Tests

### Test node network failure

1. Get a list of your nodes `gcloud compute instances list`
1. ssh to a kube node `gcloud compute ssh <node name>` 
1. `ifconfig eth0 down`
1. `gcloud compute instances reset <node>`

Notes

- Templating doesn't work inside values.yml files. Maybe in helm 3.
- Subchart config overrides are done by using the chart name from the yaml file, not the folder name.
- Disruptions https://kubernetes.io/docs/concepts/workloads/pods/disruptions/#voluntary-and-involuntary-disruptions
- Resource handling on nodes https://kubernetes.io/docs/tasks/administer-cluster/out-of-resource/