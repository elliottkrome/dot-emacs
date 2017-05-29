(use-package org-drill
  :defer t
  :commands (org-drill
             org-drill-tree
             org-drill-directory)
  :init
  (setq org-drill-maximum-items-per-session         50
        org-drill-maximum-duration                  20   ; 20 minutes
        org-drill-use-visible-cloze-face-p           t
        org-drill-add-random-noise-to-intervals-p    t
        org-drill-hint-separator                  "||"
        org-drill-left-cloze-delimiter            "<["
        org-drill-right-cloze-delimiter           "]>"
        ; org-drill-learn-fraction                0.25
        ; org-drill-cram-hours 2
        ; org-drill-leech-method 'warn
	)
  :config
  (progn
    (add-to-list 'org-modules 'org-drill)))
