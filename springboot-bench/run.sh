CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="app"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]; then
    ACTION="upgrade"
    shift 1
fi
echo "helm action: $ACTION"

helm $ACTION `basename $CWD` $CWD \
-n $NAMESPACE \
--create-namespace \
--reset-values \
$*