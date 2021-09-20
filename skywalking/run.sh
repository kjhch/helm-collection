set -x
CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.1.0"
ACTION="install"
ADDITIONAL_FLAGS=$*

if [[ "$1" == "u" || "$1" == "upgrade" ]]; then
    ACTION="upgrade"
    shift 1
    ADDITIONAL_FLAGS="$* --reset-values"
fi
echo "helm action: $ACTION"

helm repo add skywalking https://apache.jfrog.io/artifactory/skywalking-helm
helm repo update
helm $ACTION `basename $CWD` skywalking/skywalking \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml \
$ADDITIONAL_FLAGS
