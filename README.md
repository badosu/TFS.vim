TFS.vim
============================================================

TFS.vim aims to enable regular TFS operation from within Vim.

## Available commands ##

* **TFget:** 					Get latest version from file or directory
* **TFadd, TFdelete:** 			Add/deletes file
* **TFundo:** 					Undo changes in file or directory
* **TFshelve, TFunshelve:** 	Shelve/Unshelve changeset
* **TFcheckout, TFcheckin:** 	Checkout/checkin file or directory
* **TFhistory:** 				Show history
* **TFresult:** 				Runs arbitrary tf command, see (http://msdn.microsoft.com/en-us/library/z51z7zy0(v=vs.80).aspx)

## Installation ##

Just paste the contents of TFS.vim somewhere in your `_vimrc` file for now, and check the binary path option.

It is necessary for the commands to be run on files mapped by TFS, otherwise it will not return anything.

## Options ##

To set TFS binary, put this in your .vimrc: 

`let g:tfvim_bin = "C:/..."`

## Quick usage tips ##

* `:TFget -R directory` *Get latest version on directory*
* `:TFget file` *Get latest file*
* `:TFadd -R directory` *Checkin current editing file*
* `:TFhistory` *View history*
* `:TFadd %:p` *Add current editing file*
* `:TFcheckout %:p` *Checkout current file*
* `:TFcheckin %:p` *Checkin current editing file*
* `:TFshelve` *Shelve changeset*
* `:TFunshelve` *Unshelve changeset*

## Advanced usage ##

You may use any tf command available with **TFresult**

* `:TFresult branch trunk wi44-arbitrary-feature`

## Viable Improvements ##

* Silent Option `let g:tfvim_silent`
* Always Recursible Option `let g:tfvim_alwaysrecursible`
* Adapt it for linux `tf` binary
* Display status window
* **TFbranch** and **TFmerge**
* Merge directly in Vim

*Some where inspired by fugitive.vim's `:Gstatus`*
