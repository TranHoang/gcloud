echo '### Install Python ...'
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl build-essential git-core python g++ python-pip python-dev libjpeg-dev libpng12-dev libmysqlclient-dev python-setuptools
sudo easy_install -U distribute

# intall redis server for redis queue
sudo apt-get update -y


# config UTF-8 for server environment
sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 
sudo dpkg-reconfigure locales


# intall redis server for redis queue
sudo apt-get install -y redis-server

echo 'install virtual environment python'
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

echo 'create virtual environment for django'
sudo mkdir /denv
sudo virtualenv /denv

echo 'set permistion for virtual environment'
sudo chmod 777 /denv
sudo chmod 777 /denv/bin/
sudo chmod 777 /denv/lib/python2.7/site-packages/

echo 'source /denv/bin/activate' >> ~/.bashrc

source /denv/bin/activate

# sync time for server
sudo ntpdate-debian

# Install google cloud SDK
curl https://sdk.cloud.google.com | bash
