;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

(setq org-startup-indented      t    ; indentation (?)
      org-hide-leading-stars    t    ; hide stars, MAYBE UNNECESSARY
      org-hide-emphasis-markers t    ; make *bold* look plain, like bold
      org-src-fontify-natively  t    ; 
      org-image-actual-width    550  ; rescale pixel-width of inline images
      )

;; visual line mode by default
;;
(add-hook 'org-mode-hook #'visual-line-mode)

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode)

(provide 'ek-org-formatting)
;;; ek-org-formatting ends here
