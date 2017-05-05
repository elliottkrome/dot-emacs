

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; basic package stuff - allows all of the other package configuration to work
;;
(package-initialize)
(load "~/.emacs.d/ek_el_files/ek-init-gnrl-package-stuff.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; everything that is portable
;;
(load "~/.emacs.d/ek_el_files/ek-magit.el")
(load "~/.emacs.d/ek_el_files/ek-company.el")
(load "~/.emacs.d/ek_el_files/ek-python.el")
; (load "~/.emacs.d/ek_el_files/ek-c-gen.el")
(load "~/.emacs.d/ek_el_files/ek-markdown.el")
(load "~/.emacs.d/ek_el_files/ek-scratch.el")
(load "~/.emacs.d/ek_el_files/ek-ido.el")
(load "~/.emacs.d/ek_el_files/ek-projectile.el")
(load "~/.emacs.d/ek_el_files/ek-misc.el")    ;; organize this !
; (load "~/.emacs.d/ek_el_files/ek-wttrin.el")
(load "~/.emacs.d/ek_el_files/ek-dired.el")
(load "~/.emacs.d/ek_el_files/ek-org.el")
(load "~/.emacs.d/ek_el_files/ek-window-behavior.el")
(load "~/.emacs.d/ek_el_files/ek-git-gutter.el")
(load "~/.emacs.d/ek_el_files/ek-iedit-and-rainbow-delimiters.el")
(load "~/.emacs.d/ek_el_files/ek-hideshow.el")
(load "~/.emacs.d/ek_el_files/ek-which-key.el")
(load "~/.emacs.d/ek_el_files/ek-suggest.el")
(load "~/.emacs.d/ek_el_files/ek-messages.el")
(load "~/.emacs.d/ek_el_files/ek-flycheck.el")
(load "~/.emacs.d/ek_el_files/ek-keybindings.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; local stuff goes here
;;
(load "~/.emacs.d/ek_el_files/ek-private.el")
(load "~/.emacs.d/ek_el_files/ek-registers.el")
(load "~/.emacs.d/ek_el_files/ek-org-capture-templates.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file
      (expand-file-name "ek_el_files/ek-custom.el" user-emacs-directory))
(load custom-file)
