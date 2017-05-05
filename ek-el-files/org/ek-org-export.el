;; ****************__TEST_AREA__********************************
(setq org-latex-packages-alist '(("margin=2.5cm" "geometry" nil)))

;; http://pages.sachachua.com/.emacs.d/Sacha.html
(setq org-export-backends '(org latex icalendar html ascii))
(setq org-export-htmlize-output-type 'css)

(setq org-export-preserve-breaks t)

(defun my-html-nobreak-space-filter (text backend info)
  (and (org-export-derived-backend-p backend 'html)
       (replace-string " " "&nbsp;" text)
       ))

;(add-to-list 'org-export-filter-plain-text-functions
;	     #'my-html-nobreak-space-filter)
