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

      ;; navigate to beginning of src bock
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
		(progn 

		  ;; get the name of the target file for tangling and store in
  		  ;; `f-name'. Begin by moving point to the beginning of
  		  ;; target string. There is certainly a better way to do this.
		  ;;
		  (search-forward ":tangle") (forward-word) (backward-word)
		  (let* ((f-name-start (point))
			 (f-name-end (- (forward-whitespace 1) 1))
			 (f-name (buffer-substring f-name-start f-name-end)))
		    
		    ;; if `f-name' ends in ".scad", open with OpenSCAD
		    ;;
		    (if (s-suffix? ".scad" f-name)
			(call-process scad-command nil 0 nil f-name)
		      
		      (message "You are not in a scad block, dummy."))))
	      (message "Current source block not a tangle target.")))))
    (message "You are not in a source block at all!")))

