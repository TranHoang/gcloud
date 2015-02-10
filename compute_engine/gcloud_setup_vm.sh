# Include functions
. functions.sh

PROJECT_NAME="asoft-web-server-project"

echo "Config gloud working session on " $PROJECT_NAME
gcloud config set project $PROJECT_NAME

echo "Manage VM Instance"
PS3='Please enter your choice: '
options=("Create Instance" "Update Instance" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create Instance")
            create_instance
            ;;
        "Update Instance")
            echo "you chose Update Instance"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done


