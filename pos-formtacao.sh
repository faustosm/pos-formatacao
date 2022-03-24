#!/usr/bin/env bash

echo "----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Execute esse script com privilégios de super usuário :: |\n"

echo "----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Atualização do SO Ubuntu 20.04 :: |\n"

sudo apt update && apt upgrade -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instalação de ferramentas auxiliares :: |\n"

sudo apt install nano git htop wget gpg curl gdebi-core dpkg -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instalação navegador Google chrome :: |\n"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instalação navegador Vivald :: |\n"

wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository --yes 'deb https://repo.vivaldi.com/archive/deb/ stable main' 
sudo apt update && sudo apt install vivaldi-stable -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação terminator :: |\n"

sudo apt install terminator -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: DEVOPS TOOLS :: |\n"

echo "----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação vscode :: |\n"

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Sublime Text :: |\n"

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação k9s :: |\n"

sudo snap install k9s

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação Lenss :: |\n"

sudo snap install kontena-lens --classic

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação kubectl 'Kubernetes' :: |\n"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Postman :: |\n"

sudo snap install postman

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação AWS Cli :: |\n"

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: remmina :: |\n"

sudo snap install remmina

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Ferramentas extras :: |\n"

echo "----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Todoist: To-Do List & Tasks :: |\n"

sudo snap install todoist

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação flameshot 'Screenshot' :: |\n"

sudo snap install flameshot

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação flameshot SimpleScreenRecorder :: |\n"

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -r -y
sudo apt-get update -y
sudo apt-get install simplescreenrecorder -y
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -r -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação Evernote :: |\n"

wget https://cdn1.evernote.com/boron/linux/builds/Evernote-10.7.6-linux-ddl-ga-2321.deb -O evernote.deb
sudo dpkg -i evernote.deb
sudo apt-get install -f
sudo apt install ./evernote.deb

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação zsh :: |\n"

sudo apt install zsh -y

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Instação Oh My Zsh :: |\n"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# Pessonalizar oh-my-zsh (exemplo)

# https://marcelosena.com/como-instalar-o-shell-zsh-oh-my-zsh-tema-e-plugins/


echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Removendo arquivos não necessários pós instalação :: |\n"

rm google*
rm kubectl*
rm evernote*
rm -r aws*
echo "\nRemovido arquivos!!! " 

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Limpando cache do apt no ubuntu :: |\n"
sudo apt-get clean -y
echo "Limpado cache!!! "

echo "\n----------------------------------------------------------------------------------------------------------------------------"
echo "| :: Removido kernels antigos no Ubuntu :: |\n"
sudo apt-get autoremove --purge
echo "\nRemovido kernels antigos!!! \n"
