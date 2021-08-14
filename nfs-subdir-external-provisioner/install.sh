CWD=$(cd "$(dirname "$0")";pwd)

yum -y install nfs-utils
mkdir /nfs-storage
chmod 777 /nfs-storage
echo "/nfs-storage *(rw,no_root_squash,sync)" > /etc/exports
systemctl restart rpcbind && systemctl enable rpcbind
systemctl restart nfs && systemctl enable nfs

helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner -f $CWD/values.yml