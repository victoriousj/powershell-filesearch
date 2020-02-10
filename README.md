# powershell-filesearch
Search through a directory for either a sub-directory or a file with PowerShell. This will recursively search through all directories from where the command is run.

![Quickly find and open your files and folders](https://raw.githubusercontent.com/victoriousj/powershell-filesearch/master/FileSearch.png)

## Instructions:
* Clone the repo
* Double-click install-filesearch.exe
* ???
* Open PowerShell
* Success!

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
