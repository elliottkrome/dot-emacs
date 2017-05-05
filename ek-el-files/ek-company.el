
(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (progn

    (use-package company-flx                   ;;;; fuzzy matching
      :ensure t                                ;; ensure installation
      :defer t)                                ;; load lazily

    (use-package company-quickhelp             ;;;; documentation tooltip
      :ensure t                                ;; ensure installation
      :init                                    ;; 
      (company-quickhelp-mode 1)
      (setq company-quickhelp-delay 0.9))

  :config
  (setq company-idle-delay                0.5  ;; shorten
	company-minimum-prefix-length       1
	company-echo-delay                  0
	company-tooltip-limit              20
	company-tooltip-align-annotations   t)))


(global-company-mode)


