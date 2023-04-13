#!/bin/bash
# Colors
cyan=$'\033[0;36m' # sets the variable purple to a bold purple color for terminal output
reset=$'\033[0;39m' # sets the variable reset to the default color for terminal output
red=$'\033[0;31m' # sets the variable red to a red color for terminal output
green=$'\033[0;32m' # sets the variable green to a green color for terminal output

# Commands
clear; # clears the terminal
echo "${cyan}
   _____ ________   _________ .__                                     
  /  |  |\_____  \  \_   ___ \|  |   ____ _____    ____   ___________ 
 /   |  |_/  ____/  /    \  \/|  | _/ __ \\\\__  \  /    \_/ __ \_  __ \\
/    ^   /       \  \     \___|  |_\  ___/ / __ \|   |  \  ___/|  | \/
\____   |\_______ \  \______  /____/\___  >____  /___|  /\___  >__|   
     |__|        \/         \/          \/     \/     \/     \/  
                                                            by cj4ck"
initial_df=$(df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mb|[0-9]*\.*[0-9]*Gb|[0-9]+\.*[0-9]+% |$") # stores the current disk usage in the initial_df variable and formats it with grep
echo -e "${cyan}Current space:\n${reset}${initial_df}${reset}" # prints the initial_df variable with purple color for the header and resets the color for the rest of the output
echo ""
cd; # changes directory to the home directory
echo "${red}! Disclaimer - Use at your own risk!"
echo "${red}! This script will nuke your cache (VSCode theme&settings etc.) !"
read -n1 -p "${cyan}Do you want to free up space on your computer? [${green} Y ${cyan}/${red} N ${cyan}]${reset} " input # prompts the user to enter y or n to indicate whether they want to clean up space on their computer
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then # checks if the user input is not empty and is "y"
    echo "${green}Cleaning up, please wait...";
    echo "${green}Cleaning up ./.Trash/*, please wait..."
    rm -rfv ./.Trash/* >> log_file.txt; # removes all files and directories in the .Trash folder
    echo "${green}Cleaning up ./.cache/*, please wait..."
    rm -rfv ./.cache/* >> log_file.txt; # removes all files and directories in the .cache folder
    echo "${green}Cleaning up ./Library/Caches/*, please wait..."
    rm -rfv ./Library/Caches/* >> log_file.txt; # removes all files and directories in the Library/Caches folder
    echo "${green}Cleaning up ./Library/Containers/com.docker.docker/*, please wait..."
    rm -rfv ./Library/Containers/com.docker.docker/* >> log_file.txt; # removes all files and directories in the Library/Containers/com.docker.docker folder
    echo "${green}Cleaning up ./Library/Containers/*, please wait..."
    rm -rfv ./Library/Containers/* >> log_file.txt; # removes all files and directories in the Library/Containers folder
    echo "${green}Cleaning up ./Library/Application Support/Code/User/*, please wait..."
    rm -rfv ./Library/Application\ Support/Code/User/* >> log_file.txt; # removes all files and directories in the Library/Application Support/Code/User folder
    echo "${green}Cleaning up ./Library/Application Support/Code/CachedData/*, please wait..."
    rm -rfv ./Library/Application\ Support/Code/CachedData/* >> log_file.txt; # removes all files and directories in the Library/Application Support/Code/CachedData folder
    echo "${green}Cleaning up ./Library/Developer/CoreSimulator/*, please wait..."
    rm -rfv ./Library/Developer/CoreSimulator/* >> log_file.txt; # removes all files and directories in the Library/Developer/CoreSimulator folder
    echo "${green}Cleanup completed."
    echo ""
else
    echo "${red}Cleanup not performed. ";
    echo ""
fi

read -n1 -p "${cyan}Do you want to clean up the Downloads folder? [${green} Y ${cyan}/${red} N ${cyan}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
        echo "${green}Cleaning up Downloads, please wait..."${red};
		rm -rfv ./Downloads/*;
        echo "${green}Cleanup completed. Logs updated."
    echo -e "${cyan}\nDisk space before cleanup:\n${reset}${initial_df}${cyan}\n\nDisk space after cleanup:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gb|[0-9]+\.*[0-9]+% |$"
    echo ""
else
    echo "${red}Downloads not cleaned up.";
    echo -e "${cyan}\nDisk space before cleanup:\n${reset}${initial_df}${cyan}\n\nDisk space after cleanup:${reset}"
        df -h . | grep --color=always -E "Size|Used|Avail|Capacity|[0-9]*\.*[0-9]*Mi|[0-9]*\.*[0-9]*Gb|[0-9]+\.*[0-9]+% |$"
fi
    echo "${green}Thank you for using my script! <3"
