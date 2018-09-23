
cd /tmp/

set -e

# Tools
sudo apt-get update
sudo apt-get install -y curl

# Google cloud
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y google-cloud-sdk

echo "Installing cfssl"
wget -q --timestamping \
  https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
  https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
chmod +x cfssl_linux-amd64 cfssljson_linux-amd64
sudo cp cfssl_linux-amd64 /usr/local/bin/cfssl
sudo cp cfssljson_linux-amd64 /usr/local/bin/cfssljson

echo "Installing kubectl"
wget -q --timestamping https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo cp kubectl /usr/local/bin/

echo "Installing helm client"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

echo "Installing Ansible"
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible python-pip
sudo pip install apache-libcloud jmespath

echo "Install docker"
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
