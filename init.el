(load "~/.emacs.d/ek_el_files/ek-init-gnrl-package-stuff.el")
(load "~/.emacs.d/ek_el_files/ek-scratch.el")
(load "~/.emacs.d/ek_el_files/misc.el")



(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t)

(use-package company
  :ensure t
  :defer t)

(load "~/.emacs.d/ek_el_files/ek-keybindings.el")
(load "~/.em


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
