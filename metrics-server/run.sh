CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kube-system"
VERSION="4.1.10"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]
then ACTION="upgrade"
fi
echo "action: $ACTION"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm $ACTION metrics-server bitnami/metrics-server \
--values $CWD/values.yml \
--version $VERSION \
-n $NAMESPACE
