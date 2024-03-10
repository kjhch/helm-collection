CWD=$(cd "$(dirname "$0")";pwd)
# VERSION="4.7.1"
# ACTION="install"
# if [[ "$1" == "u" || "$1" == "upgrade" ]]
# then ACTION="upgrade"
# fi
# echo "action: $ACTION"

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
# helm $ACTION ingress-nginx ingress-nginx/ingress-nginx \
# -n ingress \
# --create-namespace \
# --version $VERSION \
# --values $CWD/values.yml
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
-n ingress \
--create-namespace \
--values $CWD/values.yml
