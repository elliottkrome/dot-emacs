;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; cleaner indentation
(setq org-startup-indented t)

;; hide stars, MAYBE UNNECESSARY
(setq org-hide-leading-stars t)

;; make *bold* look plain, like bold
(setq org-hide-emphasis-markers t)

;; visual line mode by default
;;
(add-hook 'org-mode-hook #'visual-line-mode)

(setq org-src-fontify-natively t)

(provide 'ek-org-formatting)
;;; ek-org-formatting ends here
