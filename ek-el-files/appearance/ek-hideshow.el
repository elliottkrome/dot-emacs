(use-package hideshowvis
  :ensure t
  :diminish hs-minor-mode
  :bind  (("C-c TAB" . hs-toggle-hiding)
          ("C-\\" . hs-toggle-hiding)
          ("M-+" . hs-show-all)
	  ("M-=" . hs-hide-all))
  :config
  (progn
    (hideshowvis-enable)

    ;; graphical +/- fold buttons
    (hideshowvis-symbols)))

;; unsuccesful attempt to get python Class.method_name folding
;;
;; (setq hs-level 2)
;; (setq hs-fold-show-only-methods-active-p nil)
;;   (defun hs-fold-show-only-methods ()
;;     "Toggle between hiding all methods using `hs-level' or
;; showing them."
;;     (interactive)
;;     (save-excursion
;;       (if hs-fold-show-only-methods-active-p
;;           (progn
;;             (hs-show-all)
;;             (setq-local hs-fold-show-only-methods-active-p t))
;;         (progn
;;           (goto-char (point-min))
;;           (hs-hide-level hs-level)
;;           (setq-local hs-fold-show-only-methods-active-p t)))))

