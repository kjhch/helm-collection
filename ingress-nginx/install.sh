CWD=$(cd "$(dirname "$0")";pwd)
VERSION="3.31.0"

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress --version $VERSION --values $CWD/values.yml
