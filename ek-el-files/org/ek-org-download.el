(use-package org-download
  :ensure t
  :after org
  :config
  (setq org-download-method 'directory)

  ;; org-download seems to have a problem with whitespace
  ;; (and maybe angle-brackets (?))in sub-header strings.
  ;; This function advises an internal function to clean these strings
  ;;
  (defun ek-clean-org-directory (orig-val)
    "Remove angle brackets and replace whitespace with underscores. Used to advise `org-download--dir-2'."
    (replace-regexp-in-string
     ">" ""
     (replace-regexp-in-string
      "<" ""
      (replace-regexp-in-string
       " " "_" orig-val))))

  ;; advise the internal function
  ;;
  (advice-add 'org-download--dir-2 :filter-return #'ek-clean-org-directory))
