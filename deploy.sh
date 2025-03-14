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

npm install

pm2 start ./bin/www --name mathapp