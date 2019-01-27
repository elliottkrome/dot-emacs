(use-package org-download
  :ensure t
  :after org
  :config
  (setq org-download-method 'directory)

  ;; org-download seems to have a problem with whitespace
  ;; (and maybe angle-brackets (?)) in sub-header strings.
  ;; This function advises an internal function to clean these strings
  ;;
  (defun ek/clean-org-directory (orig-val)
    "Remove angle brackets and replace whitespace with underscores. Used to advise `org-download--dir-2'."
    (replace-regexp-in-string
     ">" ""
     (replace-regexp-in-string
      "<" ""
      (replace-regexp-in-string
       " " "_" orig-val))))

  ;; advise the internal function
  ;;
  (advice-add 'org-download--dir-2 :filter-return #'ek/clean-org-directory)

  ;; one of my earliest successful less-trivial functions
  ;;
  (defun ek/setup-org-download-image-dir (&optional dir_a)
    "Create a file-local variable to tell org-download where to put images:
TARGET_DIR/resources/images"
    (let* ((dir_base_target (if dir_a
				dir_a
			      default-directory))
	   (dir_resources (concat dir_base_target "resources/"))
	   (dir_images    (concat dir_resources "images")))
      (ek/mkdir dir_resources)
      (ek/mkdir dir_images)
      dir_images))

  (defun ek/org-insert-clipboard-image ()
    "Take a screenshot into a time stamped file in `org-download-image-dir',
prompting for base name, and inserting a link to this file."
    (interactive)
    (let* (
	   ;; screencapture needs the full, expanded path
	   (path (expand-file-name org-download-image-dir)) 
	   ;; a name is useful when viewing directory outside of the org buffer
	   (image-name (read-string "Name to store image under: "))
	   ;; append a time stamp to the name for uniqification
	   (full-name (concat path image-name "_"
			      (format-time-string "%Y%m%d_%H%M%S_.png"))))
      ;; make sure the directory exists
      (unless (file-exists-p (file-name-directory full-name))
	(make-directory (file-name-directory full-name)))
      ;; take screenshot
      (if (eq system-type 'darwin)
	  (call-process "screencapture" nil nil nil "-i" full-name))
      (if (eq system-type 'gnu/linux)
	  (call-process "import" nil nil nil full-name))
      ;; insert into file if correctly taken
      (if (file-exists-p full-name)
	  (insert (concat "[[file:" full-name "]]")))
      ;; make sure inline-images display is on
      (org-display-inline-images))))

