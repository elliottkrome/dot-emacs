
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
    (use-package company-quickhelp
      :ensure t
      :init
      (company-quickhelp-mode 1)
      (setq company-quickhelp-delay 1.5))
    (global-company-mode))
  :config
  (setq company-idle-delay             1.5
	company-minimum-prefix-length  1
	company-echo-delay             0
	company-tooltip-limit         20)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>")
    'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))

(use-package iedit
  :ensure t)

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
 '(package-selected-packages
   (quote
    (rainbow-delimiters-mode t rainbow-delimiters iedit ido-occur company-quickhelp company-flx magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-calendar-event ((t (:background "#ffffff" :foreground "#3774CC" :weight bold)))))
