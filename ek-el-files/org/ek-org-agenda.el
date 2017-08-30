;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-agenda)

(defvar ek-org-agenda-face-height 1.2 "Size for org agenda faces.")
(defvar ek-num-days-agenda 14 "Number of days in agenda view")

;; Use sticky agenda's so they persist
(setq org-agenda-sticky t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

; includes holidays and astronomical info in agenda
(setq org-agenda-include-diary t)


;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; starts agenda view on current day
;; (setq org-agenda-start-on-weekday nil)
(setq org-agenda-start-on-weekday 1)

;; for easy switching to weekly agenda view
;;
(defun ek-switch-to-buffer-weekly-agenda (&optional arg)
  "A helper function for immediate switching to *Org Agenda(a)* buffer."
  (interactive "P")
  (org-agenda arg "a"))


;; sets agenda view default to be 5 days
;  (setq org-agenda-span 5)

;; TESTING, check it out
;(setq org-agenda-time-grid
;      '((daily today require-timed)
;       "----------------"
;       (800 1000 1200 1400 1600 1800)))


(defun agenda-new-frame ()
  "Make agenda in new frame."
  (interactive)
  (make-frame)
  (org-agenda)
  (delete-other-windows))


(add-hook 'org-agenda-finalize-hook 'ek-color-org-agenda)

;; some predefined colors: http://raebear.net/comp/emacscolors.html
;;
(defun ek-color-org-agenda ()
  (interactive)
  (save-excursion
  (color-org-header "class:" "black" "#cd950c")
  (color-org-header "fitness:" "#3b0000" "RosyBrown1")))

(defun color-org-header (tag backcolor forecolor)
  "Color agenda entries based on tag."
  (goto-char (point-min))
  (while (re-search-forward tag nil t)
    (add-text-properties (point-at-bol) (point-at-eol)
                     `(face (:background, backcolor, :foreground, forecolor)))))



;; org-deadline-warning-days specifies how many days fore agenda shows warning
;  default is 14
;  (setq org-deadline-warning-days 30)


(provide 'ek-org-agenda)
;;; ek-org-agenda.el ends here
