
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic package stuff - allows all of the other package configuration to work
;;

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/ek-el-files/ek-init-gnrl-package-stuff.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; everything that is portable
;;
(load "~/.emacs.d/ek-el-files/ek-organization.el")
(load "~/.emacs.d/ek-el-files/ek-backup.el")
(load "~/.emacs.d/ek-el-files/ek-magit.el")
(load "~/.emacs.d/ek-el-files/ek-company.el")
(load "~/.emacs.d/ek-el-files/ek-scratch.el")
(load "~/.emacs.d/ek-el-files/ek-ido.el")
(load "~/.emacs.d/ek-el-files/ek-projectile.el")
(load "~/.emacs.d/ek-el-files/ek-misc.el")
(load "~/.emacs.d/ek-el-files/ek-dired.el")
(load "~/.emacs.d/ek-el-files/ek-editing-behavior.el")
(load "~/.emacs.d/ek-el-files/ek-grep.el")
(load "~/.emacs.d/ek-el-files/ek-buffer-management.el")
(load "~/.emacs.d/ek-el-files/ek-org.el")
(load "~/.emacs.d/ek-el-files/ek-git-gutter.el")
(load "~/.emacs.d/ek-el-files/ek-iedit.el")
(load "~/.emacs.d/ek-el-files/ek-which-key.el")
(load "~/.emacs.d/ek-el-files/ek-suggest.el")
(load "~/.emacs.d/ek-el-files/ek-messages.el")
(load "~/.emacs.d/ek-el-files/ek-prog.el")
(load "~/.emacs.d/ek-el-files/ek-yasnippet.el")
(load "~/.emacs.d/ek-el-files/ek-appearance.el")
(load "~/.emacs.d/ek-el-files/ek-keybindings.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; local stuff goes here
;;
(load "~/.emacs.d/ek-el-files/ek-private.el" t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file (expand-file-name "ek-el-files/ek-custom.el"
				    user-emacs-directory))
(load custom-file)

