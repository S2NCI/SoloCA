node -v
npm -v

# Remove any old versions
sudo apt remove nodejs npm

sudo apt update

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo npm install -g pm2

pm2 stop mathapp

# Check if SoloCA directory exists
if [ -d "SoloCA" ]; then
  cd SoloCA
else
  echo "SoloCA directory does not exist!"
  exit 1
fi

#!/bin/bash
# Check if private key exists, if not, create one
if [ ! -f */SoloCA/privatekey.pem ]; then
  echo "Private key not found, generating a new one..."
  openssl genpkey -algorithm RSA -out /path/to/privatekey.pem
  openssl rsa -pubout -in /SoloCA/privatekey.pem -out /SoloCA/publickey.pem
fi

npm install

pm2 start ./bin/www --name mathapp

pm2 save