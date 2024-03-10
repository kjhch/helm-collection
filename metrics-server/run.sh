CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kube-system"
# VERSION="5.10.13"
# ACTION="install"
# if [[ "$1" == "u" || "$1" == "upgrade" ]]
# then ACTION="upgrade"
# fi
# echo "action: $ACTION"

kubectl apply -f role-binding.yml

helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
# helm $ACTION metrics-server bitnami/metrics-server \
# --values $CWD/values.yml \
# --version $VERSION \
# -n $NAMESPACE

helm upgrade --install metrics-server metrics-server/metrics-server \
--values $CWD/values.yml \
--version $VERSION \
-n $NAMESPACE