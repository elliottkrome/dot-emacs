(use-package octave
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
  (setf octave-block-offset 4))
