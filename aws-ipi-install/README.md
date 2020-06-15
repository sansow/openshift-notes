```
Configure AWS CLI

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
./awscli-bundle/install -i /usr/local/aws -b /bin/aws
aws --version
rm -rf /root/awscli-bundle /root/awscli-bundle.zip
```

```
Configure Openshift installer

OCP_VERSION=4.1.0
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-install-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-install-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-install-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/openshift-install
```

```
Configure OC tool

wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux-${OCP_VERSION}.tar.gz
tar zxvf openshift-client-linux-${OCP_VERSION}.tar.gz -C /usr/bin
rm -f openshift-client-linux-${OCP_VERSION}.tar.gz /usr/bin/README.md
chmod +x /usr/bin/oc
```

```
ls -l /usr/bin/{oc,openshift-install}
oc completion bash >/etc/bash_completion.d/openshift

aws configure
ssh-keygen -f ~/.ssh/aws-cluster-key -N ''
```

```
Download the installer from cloud.redhat.com

./openshift-install create install-config --dir={HOME}/aws-ipi-cluster


./openshift-install create cluster --dir={HOME}/aws-ipi-cluster
```

```
Check logs

{HOME}/aws-ipi-cluster/.openshift_install.log
```

```
Destroy Cluster

./openshift-install destroy cluster --dir {HOME}/aws-ipi-cluster
rm -rf $HOME/.kube
rm -rf $HOME/aws-ipi-cluster
```

```
setup cli

export KUBECONFIG=$HOME/aws-ipi-cluster/auth/kubeconfig
echo "export KUBECONFIG=$HOME/aws-ipi-cluster/auth/kubeconfig" >>$HOME/.bashrc
```

```
aws ec2 describe-instances --region=us-east-2 --output table
openshift-install graph
```
