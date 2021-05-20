antes de lanzar la instancia, cambiar el valor de la llave publica de SSH, para que el usuario utilice tu llave propia en la conexion de SSH

una vez que se lance la instancia

Actualizar paquetes "sudo apt update && sudo apt -y dist-upgrade"

Instalar Azure Core Function (lo usaremos mas adelante)

Pasos para instalarlo

# set to 9 or 10
DEBIAN_VERSION=10

apt -y install gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/$DEBIAN_VERSION/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

Instalar
sudo apt update && sudo -y apt install azure-functions-core-tools-3

Instalar AZ CLI

sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

la siguiente es una linea completa
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

la siguiente es una linea completa
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update
sudo apt-get install azure-cli

e instalar como ultimo NodeJS, usaremos el metodo PPA porque tiene una version mas reciente

cd ~
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs

para validar node -v
