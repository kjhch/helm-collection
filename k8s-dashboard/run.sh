CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kube-system"
VERSION="2.6.0"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]
then ACTION="upgrade"
fi
echo "action: $ACTION"

helm repo add k8s-dashboard https://kubernetes.github.io/dashboard
helm repo update
helm $ACTION kubernetes-dashboard k8s-dashboard/kubernetes-dashboard \
--version $VERSION \
--values $CWD/values.yml \
-n $NAMESPACE