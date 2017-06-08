
(use-package spaceline
  :ensure spaceline)

(use-package spaceline-config
  :ensure spaceline
  )

(diminish 'which-key-mode)
(diminish 'auto-revert-mode)
(diminish 'anaconda-mode)
(diminish 'hs-minor-mode)

;; Remove BufFace from mode line
;;
(eval-after-load "face-remap"
  '(diminish 'buffer-face-mode))



