CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="kubernetes-dashboard"

helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard
helm repo update

helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard \
--values $CWD/values.yml \
-n $NAMESPACE \
--create-namespace \

# 生成用户
kubectl apply -f role-binding.yml
# 生成ingress，以使用HTTP方式
kubectl apply -f ingress.yml
