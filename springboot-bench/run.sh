CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="app"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]; then
    ACTION="upgrade"
    shift 1
fi
echo "action: $ACTION"

helm $ACTION `dirname $0` . "$*" \
-n $NAMESPACE \
--create-namespace 