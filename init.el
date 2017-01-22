(load "~/.emacs.d/ek_el_files/ek-init-gnrl-package-stuff.el")

(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (progn
    (use-package company-flx
      :ensure t
      :defer t)
    (global-company-mode))
  :config
  (setq company-idle-delay             0
	company-minimum-prefix-length  2
	company-echo-delay             0
	company-tooltip-limit         20))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/ek_el_files/ek-python.el")
(load "~/.emacs.d/ek_el_files/ek-scratch.el")
(load "~/.emacs.d/ek_el_files/ek-misc.el")      ;; organize this !
(load "~/.emacs.d/ek_el_files/ek-misc-2.el")    ;;  ||
(load "~/.emacs.d/ek_el_files/ek-private.el")
(load "~/.emacs.d/ek_el_files/ek-dired.el")
(load "~/.emacs.d/ek_el_files/ek-org.el")
(load "~/.emacs.d/ek_el_files/ek-window-behavior.el")
(load "~/.emacs.d/ek_el_files/which-key-setup.el")
(load "~/.emacs.d/ek_el_files/ek-keybindings.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company-flx magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-calendar-event ((t (:background "#ffffff" :foreground "#3774CC" :weight bold)))))
