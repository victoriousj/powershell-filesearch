# powershell-filesearch
Search through a directory for either a sub-directory or a file with PowerShell. This will recursively search through all directories from where the command is run.

![Quickly find and open your files and folders](https://raw.githubusercontent.com/victoriousj/powershell-filesearch/master/FileSearch.png)

## Instructions:
To install, open PowerShell as an administrator (right-click PowerShell and select 'Run as Admin') and navigate to this folder. Run 'install.ps1'. This will copy the FileSearch PS1 file to your AppData folder and append your machine's PATH variable so that FileSearch can be run from any PowerShell session. After running 'install.ps1' close that PowerShell session and open another and you should be able to run it from this point. Also, installing things this way is not smart - you could be installing anything! Read the code in order to make sure you want this on your system.

To use:
```console
FileSearch (file name) [-dr]
```

File name can be enclosed in quotes or without:

```console
FileSearch "Paint It Black"
```
works just as well as:
```console
FileSearch Paint It Black
```

The optional "-dr" flag will switch from search for a file to searching for a directory:
```console
FileSearch "Music" -dr
```
