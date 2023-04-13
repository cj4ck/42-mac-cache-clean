# 42-mac-cache-clean

./script.sh | tee logs.txt  
Script Readme
This is a bash script for cleaning up space on a computer. The script prompts the user to indicate whether they want to clean up space on their computer and whether they want to clean up their Downloads folder. If the user chooses to proceed with the cleanup, the script deletes various files and directories in specific folders on the computer.

Usage
To use this script, follow these steps:


### Disclaimer
Use this script at your own risk. 
The script will delete various files and directories in specific folders on your iMac. 
Make sure you have a backup of any important data before running this script. It will nuke settings like VSCode theme etc.\

# Run the script using the following command:
```bash
git clone https://github.com/cj4ck/42-mac-cache-clean
cd 42-mac-cache-clean
chmod +x ./cleanup_space.sh
./cleanup_space.sh```
It will automaticly create log file with all deleted files inside your home directory.
Follow the prompts to indicate whether you want to clean up space on your computer and whether you want to clean up your Downloads folder.
