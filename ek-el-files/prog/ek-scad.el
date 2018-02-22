(use-package scad-mode
  :ensure
  :init
   (when (eq system-type 'darwin)
    (setq scad-command "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD")))

(defun ek-org-scad-helper ()
  "This allows you to open the scad source block under point via OpenSCAD."
  (interactive)

  ;; go ahead and tangle the file
  ;;
  (ek-org-babel-tangle-file)

  ;; check to make sure that we are in a source block
  ;;
  (if (eq (org-element-type (org-element-at-point)) 'src-block)

      ;; get where the source block ends and navigate there
      ;;
      (let ((head (org-babel-where-is-src-block-head)))
	(save-excursion
	  (progn
	    (goto-char head)

	    ;; if the source block is set up for tangling (the ":tangle"
	    ;; keyword is found in the header), then we can proceed
	    ;;
	    (if (string-match-p ":tangle" (buffer-substring-no-properties
					   (line-beginning-position)
					   (line-end-position)))

		;; get the name of the target file for tangling and store in
		;; `target-name'. There is certainly a better way to do this.
		;;
		(progn
		  (search-forward ":tangle")
		  (forward-whitespace 1)
		  (let* ((target-file-name-start (point))
			 (target-file-name-end (progn (forward-whitespace 1)
						      (backward-char)
						      (point)))
			 (target-name
			  (buffer-substring target-file-name-start target-file-name-end)))

		    ;; if the target name ends in ".scad", then open the file
		    ;; with OpenSCAD
		    ;;
		    (if (s-suffix? ".scad" target-name)
			(call-process scad-command nil 0 nil target-name)
		      (message "You are not in a scad block, dummy."))))
	      (message "Current source block not a tangle target.")))))
    (message "You are not in a source block at all!")))

