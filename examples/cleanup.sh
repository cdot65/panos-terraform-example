#!/bin/bash

# This script helps me delete all of the terraform files and folders created.
# I use this script to clean up my terraform projects after I am done with a demo.

# Usage: cleanup.sh [file or folder name] [file or folder name] ...
# Example: ./cleanup.sh ".terraform" ".terraform.lock.hcl" "terraform.tfstate*"

# Check if there are arguments
if [ $# -eq 0 ]; then
    echo "No arguments supplied. Please provide the names of the files or directories to be deleted."
    exit 1
fi

# Loop through the arguments and find the files and folders to be deleted
for name in "$@"; do
    # Find files and folders to be deleted and save the list
    found_items=$(find . -name "$name" -print 2>&1)

    # Check if there was an error
    if [ $? -ne 0 ]; then
        echo "An error occurred during the search process. Stopping..."
        echo "Error details:"
        echo "$found_items"
        exit 1
    fi

    # If there was no error, print the items to be deleted
    echo "Items to be deleted:"
    echo "$found_items"
done

# Ask for user's confirmation
read -p "Are you sure you want to delete these files and folders? [y/N]: " confirm
confirm=$(echo $confirm | tr '[:upper:]' '[:lower:]')

# If the user confirms, delete the files and folders
if [[ $confirm =~ ^(yes|y)$ ]]; then
    for name in "$@"; do
        # Find and delete files and folders, saving the list of deleted items
        deleted_items=$(find . -name "$name" -print -exec rm -rf {} \; 2>/dev/null)

        # If there was no error, print the deleted items
        echo "Deleted items:"
        echo "$deleted_items"
    done

    # Remove empty directories
    find . -type d -empty -delete

    echo "Process completed."
else
    echo "Process cancelled."
fi
