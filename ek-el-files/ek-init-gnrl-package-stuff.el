;;; package -- summary
;;; Commentary:
;;; Code:

;; load packages repos
;;
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  ; (package-initialize))


;; http://cachestocaches.com/2015/8/getting-started-use-package/#auto-installing-use-package
;; use-package cannot load itself, so we will give it some help.
;; Then it will take care of almost everything else
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; speeds up load-time
;;
(eval-when-compile
  (require 'use-package))
(require 'diminish)

