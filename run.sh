#!/bin/bash

# Define the paths to search for .sh files
PATH1="tools"
PATH2="commands"

# Store the current directory
CURRENT_DIR=$(pwd)

# Function to execute the selected script
run_script() {
    echo -e "\033[32mRunning $1...\033[0m"
    bash $1
}

# Select the directory to search for scripts
PS3="$(echo -e '\033[34mSelect directory:\033[0m ') "
select dir in "$PATH1" "$PATH2"; do
    case $dir in
        $PATH1)
            cd $PATH1
            FILES=$(ls *.sh)
            break
            ;;
        $PATH2)
            cd $PATH2
            FILES=$(ls *.sh)
            break
            ;;
        *) echo -e "\033[31mInvalid option\033[0m";;
    esac
done

# Build the file selection menu
PS3="$(echo -e '\033[34mSelect a file to run:\033[0m ') "
select file in "All" $(basename -s .sh $FILES) "Exit"; do
    case $file in
        "All")
            for f in $FILES; do
                run_script $f
            done
            break
            ;;
        "Exit")
            break
            ;;
        *)
            # Check if the selected file exists
            if [[ -f $file.sh ]]; then
                run_script $file.sh
            else
                echo -e "\033[31mInvalid option\033[0m"
            fi
            ;;
    esac
done

# Return to the original directory
cd $CURRENT_DIR
