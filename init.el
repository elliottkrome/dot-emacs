



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
(load "~/.emacs.d/ek_el_files/ek-markdown.el")
(load "~/.emacs.d/ek_el_files/ek-scratch.el")
(load "~/.emacs.d/ek_el_files/ek-misc.el")    ;; organize this !
(load "~/.emacs.d/ek_el_files/ek-misc-2.el")  ;;  ||
(load "~/.emacs.d/ek_el_files/ek-dired.el")
(load "~/.emacs.d/ek_el_files/ek-org.el")
(load "~/.emacs.d/ek_el_files/ek-window-behavior.el")
(load "~/.emacs.d/ek_el_files/ek-iedit-and-rainbow-delimiters.el")
(load "~/.emacs.d/ek_el_files/ek-hideshow.el")
(load "~/.emacs.d/ek_el_files/ek-which-key.el")
(load "~/.emacs.d/ek_el_files/ek-keybindings.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; locally useful stuff - delete if not on elk's machine
;;
(load "~/.emacs.d/ek_el_files/ek-private.el")
(load "~/.emacs.d/ek_el_files/ek-registers.el")
(load "~/.emacs.d/ek_el_files/ek-org-capture-templates.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode rainbow-delimiters-mode t rainbow-delimiters iedit ido-occur company-quickhelp company-flx magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-calendar-event ((t (:background "#ffffff" :foreground "#3774CC" :weight bold)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
