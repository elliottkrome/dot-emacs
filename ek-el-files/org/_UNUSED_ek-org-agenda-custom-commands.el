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
                           ((org-agenda-overriding-header
			     (concat "Project Next Tasks"
				     (if hide-scheduled-and-waiting-next-tasks
					 ""
				       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function
			     'skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header
			     (concat "Project Subtasks"
				     (if hide-scheduled-and-waiting-next-tasks
					 ""
				       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function
			     'skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header
			     (concat "Standalone Tasks"
				     (if hide-scheduled-and-waiting-next-tasks
					 ""
				       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header
			     (concat "Waiting and Postponed Tasks"
				     (if hide-scheduled-and-waiting-next-tasks
					 ""
				       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function
			     'skip-non-tasks)
                            (org-tags-match-list-sublevels
			     nil)
                            (org-agenda-todo-ignore-scheduled
			     hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
			     hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))


