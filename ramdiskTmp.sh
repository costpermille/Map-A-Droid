#/bin/bash

read -p "Are you sure you want to delete './temp_mad' and turn it into a ramdisk? (Requires sudo access) (Y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Creating ramdisk './temp_mad'"
    rm -rf ./temp_mad
    mkdir ./temp_mad
    sudo mount -t tmpfs -o size=200M none ./temp_mad
fi
exit 0
