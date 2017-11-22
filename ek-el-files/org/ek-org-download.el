(use-package org-download
  :ensure t
  :after org
  :config
  (setq org-download-method 'directory)

  ;; org-download seems to have a problem with whitespace
  ;; (and maybe angle-brackets (?)) in sub-header strings.
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
  (advice-add 'org-download--dir-2 :filter-return #'ek-clean-org-directory)

  ;; probably a better way of doing this.
  ;; TODO: move someplace else
  ;;
  (defun ek-mkdir (dir_a)
    (unless (file-exists-p dir_a)
      (message (concat "ek-mkdir --> target dir:" dir_a))
      (make-directory dir_a)))

  ;; one of my earliest successful non-trivial functions
  ;;
  (defun ek-setup-org-download-image-dir (&optional dir_a)
    "Create a file-local variable to tell org-download where to put images:
TARGET_DIR/resources/images"
    (let* ((dir_base_target (if dir_a
				dir_a
			      default-directory))
	   (dir_resources (concat dir_base_target "resources/"))
	   (dir_images    (concat dir_resources "images")))
      (ek-mkdir dir_resources)
      (ek-mkdir dir_images)
      dir_images))
  )

