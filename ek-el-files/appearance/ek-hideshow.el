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

