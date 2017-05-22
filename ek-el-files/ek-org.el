;; much taken from http://doc.norang.ca/org-mode.html

;; the newer org-mode stuff seems to require this
;;
(require 'f)


;; use the submodule org-version, as well as the extra stuff in the contrib
;;
(add-to-list 'load-path
	     (concat user-emacs-directory "submodules/org-mode/lisp"))
(add-to-list 'load-path
	     (concat user-emacs-directory "submodules/org-mode/contrib/lisp") t)


(setq org-modules '(org-bbdb
		    org-bibtex
		    org-docview
		    org-gnus
		    org-habit
		    org-info
		    org-irc
		    org-mhe
		    org-rmail
		    org-w3m
		    org-drill))

(load "~/.emacs.d/ek-el-files/org/ek-org-todo-etc-tags.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-agenda.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-babel.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-capture-refile.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-capture-templates.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-export.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-formatting.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-gnrl-ui.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-download.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-drill.el")
