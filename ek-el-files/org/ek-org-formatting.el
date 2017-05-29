;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

(setq org-startup-indented nil     ; cleaner indentation
      org-hide-leading-stars t     ; hide stars, MAYBE UNNECESSARY
      org-hide-emphasis-markers t  ; make *bold* look plain, like bold
      org-src-fontify-natively t)

;; visual line mode by default
;;
(add-hook 'org-mode-hook #'visual-line-mode)

(provide 'ek-org-formatting)
;;; ek-org-formatting ends here
