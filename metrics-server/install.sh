CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kube-system"
VERSION="4.1.10"


helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install metrics-server bitnami/metrics-server --values $CWD/values.yml --version $VERSION -n $NAMESPACE
