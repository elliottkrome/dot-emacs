# my (portable) dot-emacs
My old emacs configuration was getting very ugly, so I am starting over with the goals:
- keep everything under version control
- make everything as portable and easy to set up as possible (use-package, etc.)
- keep everything tidy

## How to use:
###### If you plan on using the python setup herein, you will want to install [anaconda](https://www.continuum.io/downloads).
###### This is only tested on emacs 25, but should work on all emacs versions >= 24.4

#### git clone into your ~/.emacs.d

`git clone https://github.com/elliottkrome/dot-emacs ~/.emacs.d`

#### Delete some stuff that is just for me
 Delete the following lines from `~/.emacs.d/init.el`:

`(load "~/.emacs.d/ek_el_files/ek-private.el")`

`(load "~/.emacs.d/ek_el_files/ek-registers.el")`

`(load "~/.emacs.d/ek_el_files/ek-org-capture-templates.el")`

#### Voilà, launch emacs.

It will take a little while the first time you launch emacs - many packages are downloading, compiling, and installing. Subsequent launches will be much faster.
