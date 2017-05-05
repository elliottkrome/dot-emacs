; (setq org-directory "~/Dropbox/org")

(setq org-default-notes-file "~/Dropbox/org/refile.org")

(defun ek-org-capture-separate-frame ()
  "Create a new frame and run `org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture))
  delete-frame)



;; refile to opened orgmode buffer
(defun org-buffer-files ()
  "Return list of opened orgmode buffer files."
  (mapcar (function buffer-file-name)
	  (org-buffer-list 'files)))


;; REFILE CONFIG
(setq org-refile-targets (quote ((nil :maxlevel . 4)
                                 (org-agenda-files :maxlevel . 4))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))



; Exclude DONE state tasks from refile targets
(defun verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'verify-refile-target)
;; END REFILE CONFIG


;; C-c C-w (refile command) by default only looks at top level headers
;  setting maxlevel to 4 allows it to look further into files
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 4))))
