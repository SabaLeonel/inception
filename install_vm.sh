echo -e "\n\e[32m5 / Creating a shared folder\e[0m"
sudo mkdir /mnt/inception
sudo mount -t vboxsf inception /mnt/inception

# Step 6: Installing Docker and Docker Compose
echo -e "\n\e[32m6 / Installing Docker and Docker Compose\e[0m"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo docker --version
sudo usermod -aG docker $USER
sudo apt install docker-compose