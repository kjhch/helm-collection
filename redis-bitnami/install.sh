CWD=$(cd "$(dirname "$0")";pwd)
VERSION="10.6.12"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install redis bitnami/redis -n public --version $VERSION --values $CWD/values.yml
helm upgrade ingress-nginx ingress-nginx/ingress-nginx -n ingress --values $CWD/../ingress-nginx/values.yml --values $CWD/ingress-values.yml