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
(setq org-agenda-start-on-weekday nil)

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

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                                  (if hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Project Subtasks"
                                                                  (if hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                                  (if hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                                  (if hide-scheduled-and-waiting-next-tasks
                                                                      ""
                                                                    " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))

;; color agenda entries based on <org-file-name>.org
;  http://stackoverflow.com/questions/17066580/color-code-agenda-view-per-file
(add-hook 'org-finalize-agenda-hook
    (lambda ()
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward "class:" nil t) 
          (add-text-properties (match-beginning 0) (point-at-eol)
             '(face (:foreground "purple"))))
        (goto-char (point-min))
	(while (re-search-forward "Deadline" nil t) 
          (add-text-properties (match-beginning 0) (point-at-eol)
             '(face (:foreground "#9911aa")))))))
;        (goto-char (point-min))
;        (while (re-search-forward "weekly:" nil t) 
;          (add-text-properties (match-beginning 0) (point-at-eol)
;             '(face (:foreground "white" :bold ))))

;; Fixme


;; org-deadline-warning-days specifies how many days fore agenda shows warning
;  default is 14
;  (setq org-deadline-warning-days 30)


