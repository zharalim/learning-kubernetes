# learning-kubernetes

Repo for learning how to use Kubernetes and Helm charts with the help of Kubernetes in Action book.

1. Create GKE project
1. `gcloud auth login`
1. `gcloud config set project <GCP PROJECT ID>`
1. Run `gcloud auth configure-docker`
1. Run `refresh.sh` to update docker image to google docker repository
1. Connect kubectl to your cluster w/ gcloud container
1. `helm init`
1. `kubectl create serviceaccount --namespace kube-system tiller`
1. `kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller`
1. `kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'`
1. Create resources with `helm install --name test -f secrets.yml node-app-helm`
