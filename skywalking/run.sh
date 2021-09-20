set -x
CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.0.0"

helm repo add skywalking https://apache.jfrog.io/artifactory/skywalking-helm
helm repo update
helm upgrade `basename $CWD` skywalking/skywalking \
--install \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml \
$* \
--reset-values 