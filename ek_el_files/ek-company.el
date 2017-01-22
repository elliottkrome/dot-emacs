
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
      (setq company-quickhelp-delay 0.9))
    (global-company-mode))
  :config
  (setq company-idle-delay                0.6
	company-minimum-prefix-length       1
	company-echo-delay                  0
	company-tooltip-limit              20
	company-tooltip-align-annotations   t)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "<tab>")
    'company-complete-common-or-cycle)
  (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous))
