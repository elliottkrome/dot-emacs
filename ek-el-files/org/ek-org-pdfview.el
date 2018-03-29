(use-package org-pdfview
  :ensure t)
(eval-after-load 'org '(require 'org-pdfview))
(delete '("\\.pdf\\'" . default) org-file-apps)
(add-to-list 'org-file-apps 
	     '("\\.pdf\\'" . (lambda (file link) (org-pdfview-open link))))
(add-to-list 'org-file-apps 
	     '("\\.pdf::\\([[:digit:]]+\\)\\'" . (lambda (file link) (org-pdfview-open link))))


(defun org-pdfview-store-link ()
  "Store a link to a pdfview buffer."
  (interactive)
  (when (eq major-mode 'pdf-view-mode)
    ;; This buffer is in pdf-view-mode
    (let* ((path buffer-file-name)
           (page (pdf-view-current-page))
           (link (concat "pdfview:" path "::" (number-to-string page))))
      (org-store-link-props
       :type "pdfview"
       :link link
       :description path))))

