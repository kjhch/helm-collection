set -x
NAMESPACE="app"
CWD=$(cd "$(dirname "$0")";pwd)

helm upgrade `basename $CWD` $CWD \
--install
-n $NAMESPACE \
--create-namespace \
$* \
--reset-values 