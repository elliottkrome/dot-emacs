;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; allow emphasized regions to also end with a "s"
;;
(setcar (nthcdr 1 org-emphasis-regexp-components)
	(concat (nth 1 org-emphasis-regexp-components) "s"))

;; visual line mode by default
;;
; (add-hook 'org-mode-hook #'visual-line-mode)

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented      nil  ; indentation (?)
      org-hide-leading-stars    t    ; hide stars, MAYBE UNNECESSARY
      org-hide-emphasis-markers t    ; make *bold* look plain, like bold
      org-src-fontify-natively  t    ; 
      org-image-actual-width    550  ; rescale pixel-width of inline images
      org-bullets-bullet-list '(" ") ; no bullets
      )

;; alternative org-bullets-bullet-list vals
; '(" ")
; '("•") 
; '("◇" "►" "⚫" "✸" "✿" "◉" "○")


(provide 'ek-org-formatting)
;;; ek-org-formatting ends here


