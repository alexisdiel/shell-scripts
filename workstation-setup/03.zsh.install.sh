echo '########## <installing zsh> ##########'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo '########## <installing zsh zplugin> ##########'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
source ~/.zshrc

echo '########## <installing terminator> ##########'
sudo apt-get update
sudo apt-get install terminator -y  -f

echo '########## <installing zsh spaceship> ##########'
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt"
sudo ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme"
source ~/.zshrc

echo '########## <installing themes> ##########'
sudo apt-get install fonts-firacode -y
sudo apt-get install fonts-powerline -y
sudo apt-get install fonts-hack-ttf -y
