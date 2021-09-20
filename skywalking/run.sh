set -x
CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.0.0"

helm upgrade `basename $CWD` $CWD/skywalking.tgz \
--install \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml \
$* \
--reset-values 