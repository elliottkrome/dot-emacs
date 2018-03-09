;; much taken from http://doc.norang.ca/org-mode.html

;; the newer org-mode stuff seems to require the package `f'
;;
(use-package f
  :ensure t)

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
		    org-drill
		    org-eww))

(load "~/.emacs.d/ek-el-files/org/ek-org-todo-etc-tags.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-agenda.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-babel.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-capture-refile.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-export.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-formatting.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-gnrl-ui.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-download.el")
(load "~/.emacs.d/ek-el-files/org/ek-org-drill.el")
; (load "~/.emacs.d/ek-el-files/org/ek-org-gcal.el")
  
