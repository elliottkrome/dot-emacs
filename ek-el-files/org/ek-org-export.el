;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

(setq org-latex-packages-alist '(("margin=2.5cm" "geometry" nil)))

;; http://pages.sachachua.com/.emacs.d/Sacha.html
(setq org-export-backends '(org latex icalendar html ascii))

(provide 'ek-org-export)
;;; ek-org-export ends here
