# my useful and mostly portable dot emacs
I declared dot emacs bankruptcy (for the first time) recently.

I don't want to do that again, so I am starting over the the goals:
- keep everything under version control (here)
- make everything as portable and easy to set up as possible (use-package, etc.)
- keep everything tidy, so I (and you) can change things easily

### how to use:
If you plan on using python, you might want to have [anaconda](https://www.continuum.io/downloads) installed before you proceed, if you plan on using the python setup herein. 

Anyway:

	`git clone https://github.com/elliottkrome/dot-emacs ~/.emacs.d`

then go into `~/.emacs.d/init.el` and delete the following lines:

	`(load "~/.emacs.d/ek_el_files/ek-private.el")`

	`(load "~/.emacs.d/ek_el_files/ek-registers.el")`

and voilà, launch emacs.

It will take a little while the first time you launch, becuase it is downloading and installing a large number of packages. It should not take nearly as long on subsequent launches.
