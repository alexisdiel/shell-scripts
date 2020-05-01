echo '########## <installing docker> ##########'
sudo apt-get remove docker docker-engine docker.io -y
sudo apt install docker.io -y -f
sudo systemctl enable --now docker
sudo usermod -aG docker ${USER}
sudo systemctl start docker
sudo systemctl enable docker
docker --version

sudo chmod 777 /var/run/docker.sock

echo '########## <installing docker-compose> ##########'
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo '########## <installing ctop> ##########'
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop

