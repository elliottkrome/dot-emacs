
(use-package neotree
  :ensure t
  :bind (("<f8>"     . neotree-toggle))
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    )
  )
