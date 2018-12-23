(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/"))
  (add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
