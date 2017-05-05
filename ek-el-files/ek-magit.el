
(use-package magit
  :bind (("C-x g" . magit-status))
  :ensure t
  :config
  (setq magit-completing-read-function 'magit-ido-completing-read))
