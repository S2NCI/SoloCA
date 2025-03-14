
# Remove any old versions
sudo apt remove nodejs npm

sudo apt update

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install openssl
sudo npm install -g pm2

pm2 stop mathapp

# Check if SoloCA directory exists
if [ -d "SoloCA" ]; then
  cd SoloCA/
else
  echo "SoloCA directory does not exist!"
  exit 1
fi


npm install
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

openssl req -x509 -newkey rsa:4096 -keyout privatekey.pem -out server.crt -days 10000 -nodes -subj "/C=IE/ST=Leinster/L=Dublin/O=National College of Ireland/OU=School of Computing/CN=ncirl.ie"


pm2 start ./bin/www --name mathapp

pm2 save

