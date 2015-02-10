echo '### Install Python ...'
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y build-essential git-core python g++ python-pip python-dev libjpeg-dev libpng12-dev libmysqlclient-dev python-setuptools
sudo easy_install -U distribute

# intall redis server for redis queue
sudo apt-get update -y
sudo apt-get install -y redis-server

# config UTF-8 for server environment
sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 
sudo dpkg-reconfigure locales

# install postgres server
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-django-with-postgres-nginx-and-gunicorn
sudo apt-get install -y python-software-properties
sudo add-apt-repository http://apt.postgresql.org
sudo apt-get update -y
sudo apt-get install -y libpq-dev python-dev


# https://wiki.postgresql.org/wiki/Apt
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install -y postgresql-9.3 postgresql-contrib-9.3
# Install PostGIS: http://trac.osgeo.org/postgis/wiki/UsersWikiPostGIS21UbuntuPGSQL93Apt
sudo apt-get install -y postgresql-9.3-postgis


#set password for postgres
sudo su - postgres psql && \password postgres

# check postgres server status
netstat -nlp | grep 5432

# install postgres dev environment
sudo apt-get -y build-dep python-psycopg2

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

# install server proxy
echo 'Install uwsgi and nginx'
sudo apt-get install -y uwsgi nginx

# sync time for server
sudo ntpdate-debian

# make logs folder