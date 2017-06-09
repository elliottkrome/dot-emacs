
(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (progn

    ;; not used currently. Seems to slow some stuff (especially octave-shell)
    ;;
    (use-package company-flx                   ;;;; fuzzy matching
      :ensure t                                ;; ensure installation
      :defer t                                 ;; load lazily
      :init
      (with-eval-after-load 'company
	(company-flx-mode nil))
      :config
      (setq company-flx-limit 100))
    

    (use-package company-quickhelp             ;;;; documentation tooltip
      :ensure t                                ;; ensure installation
      :init                                    ;; 
      (company-quickhelp-mode 1)
      (setq company-quickhelp-delay 0.9))

  :config
  (setq company-idle-delay                0.2  ;; shorten
	company-minimum-prefix-length       1
	company-echo-delay                  0
	company-tooltip-limit              20
	company-tooltip-align-annotations   t)))


(global-company-mode)


;; I find company is annoying in org-mode
;;
(defun org-mode-turn-off-company-hook ()
  "Turn off company mode for org."
  (company-mode -1))
(add-hook 'org-mode-hook 'org-mode-turn-off-company-hook)

(use-package cmake-mode
  :ensure t
  :mode "CMakeLists.txt"
  :init
  (progn
    (setq company-cmake-executable "/usr/local/bin/cmake")))
