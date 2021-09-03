CWD=$(cd "$(dirname "$0")";pwd)
VERSION="2.6.0"

helm repo add k8s-dashboard https://kubernetes.github.io/dashboard
helm repo update
helm install my-kubernetes-dashboard k8s-dashboard/kubernetes-dashboard --version $VERSION --values $CWD/values.yml -n kube-system