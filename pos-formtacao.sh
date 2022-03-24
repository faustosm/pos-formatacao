# !/usr/bin/env bash

# echo 
# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: EXECUTE ESSE SCRIPT COM PRIVILÉGIOS DE SUPER USUÁRIO :: |\n\n"

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: ATUALIZAÇÃO DO SO UBUNTU 20.04 :: |\n\n"

# sudo apt update -y && sudo apt upgrade -y

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: INSTALAÇÃO DE FERRAMENTAS/PROGRAMAS :: |\n\n"

# sudo apt install nano software-properties-common vim git htop unzip wget gpg curl gdebi-core snapd dpkg -y

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instalação navegador Google chrome :: |\n\n"

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo dpkg -i google-chrome-stable_current_amd64.deb

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instalação navegador Vivald :: |\n\n"

# wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
# sudo add-apt-repository --yes 'deb https://repo.vivaldi.com/archive/deb/ stable main' 
# sudo apt update && sudo apt install vivaldi-stable -y

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação terminator :: |\n\n"

# sudo apt install terminator -y

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: DEVOPS TOOLS :: |\n\n"

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação vscode :: |\n\n"

# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# rm -f packages.microsoft.gpg
# sudo apt install apt-transport-https
# sudo apt update
# sudo apt install code # or code-insiders

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Sublime Text :: |\n\n"

# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# sudo apt-get install apt-transport-https
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt-get update
# sudo apt-get install sublime-text

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação k9s :: |\n\n"

# sudo snap install k9s

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação Lenss :: |\n\n"

# sudo snap install kontena-lens --classic

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação kubectl 'Kubernetes' :: |\n\n"

# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Postman :: |\n\n"

# sudo snap install postman

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação AWS Cli :: |\n\n"

# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# unzip awscliv2.zip
# sudo ./aws/install

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação terraform hashicorp :: |\n\n"

# https://www.terraform.io/downloads.html # verificar a última versão do terraform

# wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip
# unzip terraform_1.1.7_linux_amd64.zip
# sudo mv terraform /usr/local/bin/

# echo "----------------------------------------------------------------------------------------------------------"
# printf "| :: Instação helm3:: |\n\n"

# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: remmina :: |\n\n"

sudo snap install remmina

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Ferramentas extras :: |\n\n"

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Todoist: To-Do List & Tasks :: |\n\n"

sudo snap install todoist

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Instação flameshot 'Screenshot' :: |\n\n"

sudo snap install flameshot

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Instação flameshot SimpleScreenRecorder :: |\n\n"

sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -r -y
sudo apt-get update -y
sudo apt-get install simplescreenrecorder -y
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder -r -y

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Instação Evernote :: |\n\n"

wget https://cdn1.evernote.com/boron/linux/builds/Evernote-10.7.6-linux-ddl-ga-2321.deb -O evernote.deb
sudo dpkg -i evernote.deb
sudo apt-get install -f
sudo apt install ./evernote.deb

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Instação zsh :: |\n\n"

sudo apt install zsh -y

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Instação Oh My Zsh :: |\n\n"

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# Pessonalizar oh-my-zsh (exemplo)

# https://marcelosena.com/como-instalar-o-shell-zsh-oh-my-zsh-tema-e-plugins/


echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Removendo arquivos não necessários pós instalação :: |\n\n"

rm google*
rm kubectl*
rm evernote*
rm -r aws*
echo "\nRemovido arquivos!!! " 

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Limpando cache do apt no ubuntu :: |\n\n"
sudo apt-get clean -y
printf "Limpado cache!!! \n\n"

echo "----------------------------------------------------------------------------------------------------------"
printf "| :: Removido kernels antigos no Ubuntu :: |\n\n"
sudo apt-get autoremove --purge
printf "\nRemovido kernels antigos!!! \n\n"
