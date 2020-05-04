echo '########## <updating and upgrade> ##########'
sudo apt-get update 
sudo dpkg --configure -a
sudo apt-get upgrade -y

echo '########## <updating snap> ##########'
sudo snap refresh

sudo bash -c 'cat <<EOF > /usr/local/bin/apt-upgrade-all.sh
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt -y autoremove
sudo apt-get clean
EOF'

sudo bash -c 'cat <<EOF > /usr/local/bin/git-delete-branches.sh
#!/bin/bash
MAIN=${1:-master}
BRANCHES=$(git branch --merged $MAIN | grep -v -e 'master\|stage\|prod\|\*')
echo Branches merged into $MAIN:
echo $BRANCHES
read -p "Delete these branches (y/n)? " answer
if [ "$answer" = "n" ]; then echo aborting && exit; fi
echo $BRANCHES | xargs -n 1 git branch -d
EOF'

sudo chmod +x /usr/local/bin/apt-upgrade-all.sh
sudo chmod +x /usr/local/bin/git-delete-branches.sh

echo '########## <installing curl> ##########'
sudo apt install curl -y -f
curl -V

echo '########## <installing spotify> ##########'
sudo snap install spotify

# echo '########## <installing authy> ##########'
# sudo snap install authy --beta

echo '########## <installing insomnia> ##########'
sudo snap install insomnia

echo '########## <installing chrome> ##########'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

rm -rf google-chrome-stable_current_amd64.deb











