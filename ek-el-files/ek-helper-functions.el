(defun add-to-list-multiple (list to-add)
  "Adds multiple items to LIST.
Allows for adding a sequence of items to the same list, rather
than having to call `add-to-list' multiple times."
  (interactive)
  (dolist (item to-add)
    (add-to-list list item)))

(defun remove-nth-element (nth list)
  (if (zerop nth)
      (cdr list)
    (let ((last (nthcdr (1- nth) list)))
      (setcdr last (cddr last))
      list)))

(defun print-strings-in-a-list (list)
  "Print each element of LIST on a line of its own."
  (while list
    (prin1 (concat (car list)))
    (setq list (cdr list))))

(defun ek/prefix-all-lines (pre body)
  (with-temp-buffer
    (insert body)
    (string-insert-rectangle (point-min) (point-max) pre)
    (buffer-string)))

(defun ek/which (bin-name-a)
  "Convenience function to call `which' and replace trailing newline"
  (let* ((sh-command (concat "which " bin-name-a))
	 (bin-path-with-newline (shell-command-to-string sh-command))
	 (regex-trailing-newline "\n$"))
    (replace-regexp-in-string regex-trailing-newline "" bin-path-with-newline)))

(defun ek/mkdir (dir-a)
  (unless (file-exists-p dir-a)
    (message (concat "ek/mkdir --> target dir:" dir-a))
    (make-directory dir-a)))

(defmacro ek/recurse-find-files-by-type (base-dir extension)
  ;; the returned list has an empty string as an entry which must be removed. 
  `(remove ""
	   (mapcar 'abbreviate-file-name
		   (split-string
		    (shell-command-to-string
		     (concat "find " ,base-dir " -name \"*." ,extension "\""))
		    "\n"))))
