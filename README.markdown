R.J.'s .vimrc
forked from [tmacwill](http://github.com/tmacwill/vimrc)
---

## Installation:

    yum install ack ctags
    mkdir ~/.vim
    git clone git://github.com/rjaquino/vimrc.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc
    vim +BundleInstall +qall

## Color Schemes

The default color scheme is [Smyck](https://github.com/hukl/Smyck-Color-Scheme/), which looks best with the corresponding terminal theme installed as well.

Other available (awesome) colorschemes:

* jellybeans
* skittles_dark
* molokai
* wombat256mod

## Shortcuts

* ; maps to :
* ,a: ack from the current directory
* ,b: browse tags
* ,c: toggle comments
* ,C: toggle block comments
* ,e: open file in new tab
* ,l: toggle NERDTree
* ,h: open a shell in a new tab
* ,k: syntax-check the current file
* ,m: toggle mouse support
* ,o: open file
* ,p: toggle paste mode
* ,r: insert regex for multiple cursors
* ,s: split window
* ,t: new tab
* ,w: close tab
* kj: enter normal mode and save
* Ctrl+{h,j,k,l}: move among windows
