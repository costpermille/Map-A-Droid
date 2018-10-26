#/bin/bash

read -p "Are you sure you want to delete '../temp_mad' and turn it into a ramdisk? (Requires sudo access) (Y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Creating ramdisk '../temp_mad'"
    rm -rf ../temp_mad
    mkdir ../temp_mad
    sudo mount -t tmpfs -o size=200M none ../temp_mad
    if [ $? -eq 0 ]; then
        echo "Ramdisk creation suceeded."
        exit 0
    else
        echo "Ramdisk creation failed. There should be error messages above."
        exit 1
    fi
else
    echo "Not creating ramdisk. Re-run script to create one."
    exit 1
fi

exit 1
