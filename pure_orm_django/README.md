# Development Environment setup

## Pre-requirements
    - Git
    - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
    - [Vagrant](http://www.vagrantup.com/)

## Step 1: Clone repository and checkout the gcloud branch
```
git clone git@asoft.git:training/tranhoang-training.git
git checkout gcloud
```

## Step 2: Vagrant up
```
cd google-cloud/pure_orm_django/vagrant
vagrant up
```

## Step 3: Run application

### Create supper user for DB and Run migrate data (Just do this step in the first times)

1. #####SSH to vagrant machine

    ```
    vagrant ssh
    ``` 
2. #####Install third party for django
    
    ```
    pip install -r /backend/requirements.txt
    ```

3. #####Enable UTF8 for database
    ```
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    export LC_CTYPE=UTF8
    locale-gen en_US.UTF-8
    sudo dpkg-reconfigure locales

4. #####Create postgres Database for develop environment

    ```
    # switch to postgres User
    sudo su - postgres
    
    # create Database with name is "todolist_dev"
    createdb --template=template0 --locale=en_US.UTF-8 -E UTF8 todolist_dev
    
    # create todolist_dev user
    createuser --pwprompt todolist_dev (input password for todolist_dev user is "todolist_dev" and shall the new role be a superuser)
    
    # Active postgres SQL command
    psql todolist_dev
    
    # Grant todolist_dev user access to todolist_dev Database
    GRANT ALL PRIVILEGES ON DATABASE todolist_dev TO todolist_dev;
    
    # Create PostGIS extension for todolist_dev Database
    CREATE EXTENSION postgis;
    
    # Exit from postgres SQL command
    Press Ctrl + D
    
    # Logout from postgres User
    logout (terminal will be prompted vagrant@yourserver)
    ```

5. Start the server
    ### Run API server
    (ssh to vagrant terminal with "vagrant ssh" commnand)

    ```
    cd /backend
    # run API server
    python manage.py runserver 0.0.0.0:8000    
    ```


# Staging Environment setup
## Pre-requirements
* Must have finished install develope environment
* Must have a cloud server on **[Google Cloud](https://cloud.google.com)** to deploy(required enable ssh)

    

