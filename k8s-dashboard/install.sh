CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kube-system"
METRICS_SERVER_VERSION="4.1.10"
VERSION="2.6.0"


helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install metrics-server bitnami/metrics-server --version $METRICS_SERVER_VERSION -n $NAMESPACE

helm repo add k8s-dashboard https://kubernetes.github.io/dashboard
helm repo update
helm install kubernetes-dashboard k8s-dashboard/kubernetes-dashboard --version $VERSION --values $CWD/values.yml -n $NAMESPACE