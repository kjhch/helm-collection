CWD=$(cd "$(dirname "$0")";pwd)
NAMESPACE="share"
VERSION="4.0.13"
ACTION="install"
if [[ "$1" == "u" || "$1" == "upgrade" ]]
then ACTION="upgrade"
fi
echo "action: $ACTION"

yum -y install nfs-utils
mkdir /nfs-storage
chmod 777 /nfs-storage
echo "/nfs-storage *(rw,no_root_squash,sync)" > /etc/exports
systemctl restart rpcbind && systemctl enable rpcbind
systemctl restart nfs && systemctl enable nfs

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
helm $ACTION nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
--version $VERSION \
--values $CWD/values.yml \
--create-namespace \
-n $NAMESPACE