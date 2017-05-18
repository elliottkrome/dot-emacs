;; Spaceline - A mode line
(use-package spaceline
  :ensure spaceline)

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme))
(add-to-list 'default-frame-alist '(font . "Source Code Pro" ))

(diminish 'which-key-mode)
(diminish 'auto-revert-mode)
(diminish 'anaconda-mode)

;; Remove BufFace from mode line
(eval-after-load "face-remap"
  '(diminish 'buffer-face-mode))
