;; http://mbork.pl/2017-05-01_show-some-last-messages

(defcustom default-messages-to-show 4
  "Default number of messages for `show-some-last-messages'.")

(defun show-some-last-messages (count)
  "Show COUNT last lines of the `*Messages*' buffer."
  (interactive "P")
  (setq count (if count (prefix-numeric-value count)
		default-messages-to-show))
  (save-excursion
	(set-buffer "*Messages*")
	(let ((prev-point-max (point-max-marker))
	  (inhibit-read-only t))
	  (message "%s"
		   (progn
		 (set-buffer "*Messages*")
		 (buffer-substring-no-properties
		  (progn
			(goto-char (point-max))
			(unless (bolp)
			  (insert "\n"))
			(forward-line (- count))
			(point))
		  (point-max))))
	  (delete-region (point-max) prev-point-max))))
