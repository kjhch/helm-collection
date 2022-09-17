set -x
CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="16.0.0"
ACTION="install"
ADDITIONAL_FLAGS=$*

if [[ "$1" == "u" || "$1" == "upgrade" ]]; then
    ACTION="upgrade"
    shift 1
    ADDITIONAL_FLAGS="$* --reset-values"
fi
echo "helm action: $ACTION"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm $ACTION `basename $CWD` bitnami/redis \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml \
$ADDITIONAL_FLAGS
