# Declare variable
SERVER_NAME="demo-webserver-001"
IP_ADDRESS="104.154.39.95"
USER_NAME="tranhoang"
PEM_FILE="keys/gce_demo_webserver_001.pem"


# Connect to VM Instance by normal SSH
ssh -i $PEM_FILE $USER_NAME@$IP_ADDRESS

# We can connect to VM Instance by gloud lib
# gcloud compute ssh $SERVER_NAME --zone=us-central1-a