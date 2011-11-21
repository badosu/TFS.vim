TFS.vim
============================================================

TFS.vim aims to enable regular TFS operation from within Vim.

## Available commands ##

*   **TFget:** Get latest version from file or directory
*   **TFadd, TFdelete:** Add deletes file
*   **TFundo:** Undo changes in file directory
*   **TFshelve, TFunshelve:** Shelve/Unshelve changeset
*   **TFcheckout, TFcheckin:** Checkout/checkin file/directory
*   **TFhistory:** Show history of file

## Options ##

To set TFS binary, put this in your .vimrc: 
`let g:tfvim_bin = "C:/..."`

## Quick usage tips: ##

* `:TFget -R directory` *Get latest version on directory*
* `:TFget file` *Get latest file*
* `:TFadd -R directory` *Checkin current editing file*
* `:TFhistory` *View history*
* `:TFadd %:p` *Add current editing file*
* `:TFcheckout %:p` *Checkout current file*
* `:TFcheckin %:p` *Checkin current editing file*
* `:TFshelve` *Checkout current file*
* `:TFunshelve`

## Possible improvements ##

* `let g:tfvim_silent` option
* `let g:tfvim_alwaysrecursible` option
