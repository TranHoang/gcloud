# Include external scripts
. constants.sh

###             Create Instance             ###
###############################################
#usage: create_instance
function create_instance {
    # Create a VM Instance
    echo "Please enter the VM Name (blank then ENTER to cancel):"
    read vm_name
    if [ ! -z "$vm_name" ]; then
        echo "Start create " $vm_name " virtual machine"
        gcloud compute instances create $vm_name --machine-type f1-micro --image $DEFAULT_OS_IMAGE_TYPE --zone $DEFAULT_ZONE
    fi
}


###             Update Instance             ###
###############################################
#usage: update_instance
function update_instance {
    # Update a VM Instance
    echo "Update VM Instance"
    
}