CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.0.13"

yum -y install nfs-utils
mkdir /nfs-storage
chmod 777 /nfs-storage
echo "/nfs-storage *(rw,no_root_squash,sync)" > /etc/exports
systemctl restart rpcbind && systemctl enable rpcbind
systemctl restart nfs && systemctl enable nfs

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --version $VERSION --values $CWD/values.yml -n $NAMESPACE