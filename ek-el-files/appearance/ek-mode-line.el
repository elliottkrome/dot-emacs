
;; (use-package spaceline
;;   :ensure spaceline)

;; (use-package spaceline-config
;;   :ensure spaceline
;;   )

(diminish 'which-key-mode)
(diminish 'auto-revert-mode)
(diminish 'anaconda-mode)
(diminish 'hs-minor-mode)
(setq mode-line-format
      '("%e"
	; mode-line-front-space
	; mode-line-mule-info
	; mode-line-client
	mode-line-modified
	mode-line-remote
	mode-line-frame-identification
	mode-line-buffer-identification
	"   "
	mode-line-position
	(vc-mode vc-mode)
	"  "
	; mode-line-modes
	; mode-line-misc-info
	mode-line-end-spaces))

;; Remove BufFace from mode line
;;
(eval-after-load "face-remap"
  '(diminish 'buffer-face-mode))



