## Google Cloud Datastore API Example (NOSQL)

There are two ways to execute the Google Cloud Datastore API

### Execute on the Google Compute Engine

```
python adams.py <web-project-name>
```


### Execute outside the Google Compute Engine

We have to create new service account credentials to identified the request   

1. Click on Credentials under the APIs & auth tab on google developer console (https://console.developers.google.com)   

2. Create new service account if not any   

3. Click Generate new JSON key or Generate new P12 key then export the private key to PEM file.   

4. Config the environment   

```
# configure your credentials
export DATASTORE_SERVICE_ACCOUNT=<service-account-email-address>
export DATASTORE_PRIVATE_KEY_FILE=<path-to-private-key-file>
## path-to-private-key-file: PEM file export from step 3
```

5. Then execute the example   

```
python adams.py <web-project-name>
```



Ref document   
[Python Google Cloud Datastore API](https://cloud.google.com/datastore/docs/getstarted/start_python/)


