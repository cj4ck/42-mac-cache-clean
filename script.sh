#!/bin/bash
# Colors
purple=$'\033[1;34m' # sets the variable purple to a bold purple color for terminal output
reset=$'\033[0;39m' # sets the variable reset to the default color for terminal output
red=$'\033[0;31m' # sets the variable red to a red color for terminal output
green=$'\033[0;32m' # sets the variable green to a green color for terminal output

# Commands
clear; # clears the terminal
echo "--------------------------------------------------------------------------------" # prints a line of dashes to the terminal
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$") # stores the current disk usage in the initial_df variable and formats it with grep
echo -e "${purple}Current space:\n${reset}${initial_df}${reset}" # prints the initial_df variable with purple color for the header and resets the color for the rest of the output
echo ""
echo "--------------------------------------------------------------------------------" # prints a line of dashes to the terminal
cd; # changes directory to the home directory
read -n1 -p "${purple}Do you want to free up space on your computer? [${green}y${purple}/${red}N${purple}]${reset} " input # prompts the user to enter y or n to indicate whether they want to clean up space on their computer
echo ""

if [ -n "$input" ] && [ "$input" = "y" ]; then # checks if the user input is not empty and is "y"
    echo "Cleaning up, please wait...";
    echo "Cleaning up ./.Trash/*, please wait..."
    rm -rf ./.Trash/*; # removes all files and directories in the .Trash folder
    echo "Cleaning up ./.cache/*, please wait..."
    rm -rf ./.cache/*; # removes all files and directories in the .cache folder
    echo "Cleaning up ./Library/Caches/*, please wait..."
    rm -rf ./Library/Caches/*; # removes all files and directories in the Library/Caches folder
    echo "Cleaning up ./Library/Containers/com.docker.docker/*, please wait..."
    rm -rf ./Library/Containers/com.docker.docker/*; # removes all files and directories in the Library/Containers/com.docker.docker folder
    echo "Cleaning up ./Library/Containers/*, please wait..."
    rm -rf ./Library/Containers/*; # removes all files and directories in the Library/Containers folder
    echo "Cleaning up ./Library/Application Support/Code/User/*, please wait..."
    rm -rf ./Library/Application\ Support/Code/User/*; # removes all files and directories in the Library/Application Support/Code/User folder
    echo "Cleaning up ./Library/Application Support/Code/CachedData/*, please wait..."
    rm -rf ./Library/Application\ Support/Code/CachedData/*; # removes all files and directories in the Library/Application Support/Code/CachedData folder
    echo "Cleaning up ./Library/Developer/CoreSimulator/*, please wait..."
    rm -rf ./Library/Developer/CoreSimulator/*; # removes all files and directories in the Library/Developer/CoreSimulator folder
    echo "${green}Cleanup completed."
else
    echo "Cleanup not performed.";
fi

read -n1 -p "${purple}Do you want to clean up the Downloads folder? [${green}y${purple}/${red}N${purple}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
        echo "Cleaning up Downloads, please wait...";
		rm -rf ./Downloads/*;
        echo "${green}Cleanup completed."
    echo "${reset}--------------------------------------------------------------------------------"
    echo -e "${purple}\nDisk space before cleanup:\n${reset}${initial_df}${purple}\n\nDisk space after cleanup:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
else
    echo "Downloads not cleaned up.";
    echo "--------------------------------------------------------------------------------"
    echo -e "${purple}\nDisk space before cleanup:\n${reset}${initial_df}${purple}\n\nDisk space after cleanup:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gi|[0-9]+\.*[0-9]+% |$"
    echo "--------------------------------------------------------------------------------"
fi
