echo '### GIT + VSCODE + DBEAVER ###' 

echo '########## <installing git> ##########'
sudo apt install git -y -f
git --version

mkdir -p ~/git

echo 'What name do you want to use in GIT user.name?'
read -r git_config_user_name
git config --global user.name "$git_config_user_name"

echo 'What email do you want to use in GIT user.email?'
read -r git_config_user_email
git config --global user.email "$git_config_user_email"

echo 'Generating a SSH Key'
ssh-keygen -t rsa -b 4096 -C "$git_config_user_email"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo '########## <installing vscode> ##########'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y  -f
sudo apt-get update
sudo apt-get install code -y -f
rm -rf packages.microsoft.gpg

echo '########## <installing settings-sync extension> ##########'
code --install-extension shan.code-settings-sync
