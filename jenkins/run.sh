CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="8.0.11"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]
then ACTION="upgrade"
fi
echo "action: $ACTION"


helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm $ACTION jenkins bitnami/jenkins \
-n $NAMESPACE \
--create-namespace \
--version $VERSION \
--values $CWD/values.yml