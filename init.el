(load "~/.emacs.d/ek_el_files/ek-init-gnrl-package-stuff.el")

(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

(use-package company
  :ensure t
  :defer t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay             0
	company-minimum-prefix-length  2
	company-echo-delay             0
	company-tooltip-limit         20))

(load "~/.emacs.d/ek_el_files/ek-python.el")
(load "~/.emacs.d/ek_el_files/ek-keybindings.el")
(load "~/.emacs.d/ek_el_files/ek-scratch.el")
(load "~/.emacs.d/ek_el_files/ek-misc.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
