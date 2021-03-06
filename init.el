;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic package stuff - allows all of the other package configuration to work
(package-initialize) ; placed automatically by package.el
(load "~/.emacs.d/ek-el-files/ek-package.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/ek-el-files/ek-configuration.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; everything that is portable (except for server stuff, which goes last)
;;
(load "~/.emacs.d/ek-el-files/ek-organization.el")
(load "~/.emacs.d/ek-el-files/ek-helper-functions.el")
(load "~/.emacs.d/ek-el-files/ek-backup.el")
(load "~/.emacs.d/ek-el-files/ek-magit.el")
(load "~/.emacs.d/ek-el-files/ek-hydra.el")
(load "~/.emacs.d/ek-el-files/ek-scratch.el")
(load "~/.emacs.d/ek-el-files/ek-projectile.el")
(load "~/.emacs.d/ek-el-files/ek-misc.el")
(load "~/.emacs.d/ek-el-files/ek-dired.el")
(load "~/.emacs.d/ek-el-files/ek-editing-behavior.el")
(load "~/.emacs.d/ek-el-files/ek-grep.el")
(load "~/.emacs.d/ek-el-files/ek-buffer-management.el")
(load "~/.emacs.d/ek-el-files/ek-org.el")
(load "~/.emacs.d/ek-el-files/ek-treemacs.el")
(load "~/.emacs.d/ek-el-files/ek-tramp.el")
(load "~/.emacs.d/ek-el-files/ek-pdf-tools.el")
(load "~/.emacs.d/ek-el-files/ek-git-gutter.el")
(load "~/.emacs.d/ek-el-files/ek-iedit.el")
(load "~/.emacs.d/ek-el-files/ek-gdb.el")
(load "~/.emacs.d/ek-el-files/ek-which-key.el")
(load "~/.emacs.d/ek-el-files/ek-suggest.el")
(load "~/.emacs.d/ek-el-files/ek-messages.el")
(load "~/.emacs.d/ek-el-files/ek-prog-helpers")
(load "~/.emacs.d/ek-el-files/ek-prog.el")
(load "~/.emacs.d/ek-el-files/ek-ibuffer.el")
(load "~/.emacs.d/ek-el-files/ek-yasnippet.el")
(load "~/.emacs.d/ek-el-files/ek-appearance.el")
(load "~/.emacs.d/ek-el-files/ek-tldr.el")
(load "~/.emacs.d/ek-el-files/ek-elfeed.el")
(load "~/.emacs.d/ek-el-files/ek-eshell.el")
(load "~/.emacs.d/ek-el-files/ek-undo-tree.el")
(load "~/.emacs.d/ek-el-files/ek-desktop.el")
(load "~/.emacs.d/ek-el-files/ek-idle-highlight-mode.el")
(load "~/.emacs.d/ek-el-files/ek-mingus.el")
(if ek/use-ivy ; one or the other (ido v. ivy)
    (load "~/.emacs.d/ek-el-files/ek-ivy-etc.el")
  (load "~/.emacs.d/ek-el-files/ek-ido.el"))
(if ek/use-mu4e 
    (load "~/.emacs.d/ek-el-files/ek-mu4e.el"))
(load "~/.emacs.d/ek-el-files/ek-mu4e.el")
(load "~/.emacs.d/ek-el-files/ek-keybindings.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; local stuff goes here
;;
(load "~/.emacs.d/ek-el-files/ek-private.el" t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; custom file is moved into ek-el-files
;;
(setq custom-file (expand-file-name "ek-el-files/ek-custom.el"
				    user-emacs-directory))
(load custom-file)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; server stuff should probably go last
;;
(load "~/.emacs.d/ek-el-files/ek-server-stuff.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))
