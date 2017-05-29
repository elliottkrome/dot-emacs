
(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t
  :config
  (progn
    (setq magit-completing-read-function 'magit-ido-completing-read)
    )
  )
