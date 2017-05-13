;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; refile to opened orgmode buffer
;;
(defun org-buffer-files ()
  "Return list of opened orgmode buffer files."
  (mapcar (function buffer-file-name)
	  (org-buffer-list 'files)))

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

;;; ek-org-capture-refile.el ends here
