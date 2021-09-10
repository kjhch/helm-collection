set -x
NAMESPACE="app"
ACTION="install"
CWD=$(cd "$(dirname "$0")";pwd)
ADDITIONAL_FLAGS=$*


if [[ "$1" == "u" || "$1" == "upgrade" ]]; then
    ACTION="upgrade"
    shift 1
    ADDITIONAL_FLAGS="$* --reset-values"
fi
echo "helm action: $ACTION"

helm $ACTION `basename $CWD` $CWD \
-n $NAMESPACE \
--create-namespace \
$ADDITIONAL_FLAGS