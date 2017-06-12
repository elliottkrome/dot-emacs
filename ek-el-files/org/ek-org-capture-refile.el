
(require 'org)

;; Use full outline paths for refile targets - we file directly with IDO
;;
(setq org-refile-use-outline-path t)

;;
;;
(setq org-completion-use-ido t)

;; Targets complete directly with IDO
;;
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
;;
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; to allow for streamlining capture of a todo or note
(defun ek-org-capture-todo ()
  (interactive)
  "Capture a TODO item"
  (org-capture nil "t"))

(defun ek-org-capture-knowledge ()
  (interactive)
  "Capture a TODO item"
  (org-capture nil "k"))

; Exclude DONE state tasks from refile targets
;; (defun verify-refile-target ()
;;   "Exclude todo keywords with a done state from refile targets."
;;   (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;; (setq org-refile-target-verify-function 'verify-refile-target)

