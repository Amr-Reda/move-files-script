# Move files script

This script move files from specific directory and his subdirectory by extensions, and it has configuration if you need to exclude subdirectory.

This project contain two scripts 
- `script.sh` this working only with linux systems
- `script.ps1` this working only with windows systems

## How it Works
---------------

### 1- Linux script
```sh
bash script.sh -l '/home/amr/Desktop/songs' -e 'mp3 wav' -x '/home/amr/Desktop/songs/Untagged /home/amr/Desktop/songs/Unrated' -d '/home/amr/Downloads/music'
```

### 1- Windows script
```ps1
.\script.ps1 -l 'C:\Users\Amr\Desktop\songs' -e 'mp3 wav' -x 'C:\Users\Amr\Desktop\songs\Untagged C:\Users\Amr\Desktop\songs\Unrated' -d 'C:\Users\Amr\Downloads\music'
```
arguments:
- `l` : the full path of directory that contains the extensions that you need to move it.
- `e` : extensions that you need to move it, you can provide more than one but should seperated by space.
- `x` : excluded subdirectories, , you can provide more than one but should seperated by space.
- `d` : the full path to the destination directory that you want to move files to it.