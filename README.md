# powershell-filesearch
search through a directory for either a sub-directory or a file with PowerShell. this will recursively search through all directories from where the command is run.

![Quickly find and open your files and folders](https://raw.githubusercontent.com/victoriousj/powershell-filesearch/master/FileSearch.png)

## Instructions:
* clone the repo or just download the .zip
* double-click install-filesearch.exe
* this will add the script to your current user's PATH env variable
* open PowerShell
* use it, abuse it

to use:
```console
FileSearch (file name) [-dr]
```

file name can be enclosed in quotes or without:

```console
FileSearch "Paint It Black"
```
works just as well as:
```console
FileSearch Paint It Black
```

the optional "-dr" flag will switch from search for a file to searching for a directory:
```console
FileSearch "Music" -dr
```
