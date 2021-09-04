CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.5.2"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]
then ACTION="upgrade"
fi
echo "action: $ACTION"


helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm $ACTION mysql bitnami/mysql \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml