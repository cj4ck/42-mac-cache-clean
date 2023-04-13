# Simple script for cleaning up cache on iMac.
Script proceeds to remove the following directories and their contents:
- ./.Trash/*
- ./.cache/*
- ./Library/Caches/*
- ./Library/Containers/com.docker.docker/*
- ./Library/Containers/*
- ./Library/Application Support/Code/User/*
- ./Library/Application Support/Code/CachedData/*
- ./Library/Developer/CoreSimulator/*
- ./Downloads/*

Each directory is cleaned up one by one, and the log of the cleanup operation is written to a file called "log_file.txt" inside your home directory. After all the directories have been cleaned up, the script prints a message indicating that the cleanup is complete.

❗ It's enerally safe to use but use this script at your own risk. ❗
The script will delete various files and directories in specific folders on your iMac. 
Make sure you have a backup of any important data before running this script. It will nuke settings like VSCode theme etc,

```bash
git clone https://github.com/cj4ck/42-mac-cache-clean
```
```bash
cd 42-mac-cache-clean
```
```bash
chmod +x ./cleanup_space.sh
```
```bash
./cleanup_space.sh
```
