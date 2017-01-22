;;; package --- Summary
;;; Commentary:
; much taken from http://doc.norang.ca/org-mode.html
;;; Code:

;; makes org mode available
(require 'org)

;; ****************__TEST_AREA__********************************

;; not working
(defun  image-new-frame-fitted  ()
  "View image in new frame."
  (interactive)
  (make-frame)
  (org-babel-open-src-block-result)
  (delete-other-windows)
  (image-mode-fit-frame))
;; end not working

(defun ek-org-capture-separate-frame ()
  "Create a new frame and run `org-capture."
  (interactive)
  (make-frame '((name . "capture")))
  (select-frame-by-name "capture")
  (delete-other-windows)
  (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
    (org-capture))
  delete-frame)

;; http://pages.sachachua.com/.emacs.d/Sacha.html
(setq org-export-backends '(org latex icalendar html ascii))
(setq org-export-htmlize-output-type 'css)

(setq org-export-preserve-breaks t)

(defun my-html-nobreak-space-filter (text backend info)
  (and (org-export-derived-backend-p backend 'html)
       (replace-string " " "&nbsp;" text)
       ))

;(add-to-list 'org-export-filter-plain-text-functions
;	     #'my-html-nobreak-space-filter)

;; VERY IMPORTANT FOR PYTHON IN BABEL
(setq org-src-preserve-indentation t)


;; ****************__END_TEST_AREA__****************************

(setq org-agenda-files '("~/Dropbox/org/applications.org"
			 "~/Dropbox/org/appointments.org"
			 "~/Dropbox/org/class.org"
			 "~/Dropbox/org/diary.org"
			 "~/Dropbox/org/hw.org"
			 "~/Dropbox/org/misc_stuff/music.org"
			 "~/Dropbox/org/misc_stuff/purchase_list.org"
			 "~/Dropbox/org/misc_stuff/special_days.org"
			 "~/Dropbox/org/misc_stuff/weekly.org"
			 "~/Dropbox/org/notes/emacs_notes.org"
			 "~/Dropbox/org/notes/microelectronics.org"
			 "~/Dropbox/org/notes/gen_chem.org"
			 "~/Dropbox/org/notes/mech_systems.org"
			 "~/Dropbox/org/notes/power.org"
			 "~/Dropbox/org/notes/notes_to_refile.org"
			 "~/Dropbox/org/notes/sen_design.org"
			 "~/Dropbox/org/personal_learning.org"
			 "~/Dropbox/org/refile.org"))

;;;;;;;;;;;;;;;;;; key bindings ;;;;;;;;;;;;;;;;
;   https://www.masteringemacs.org/article/mastering-key-bindings-emacs
;; global
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key org-mode-map (kbd "<f5>") 'org-deadline)
(global-set-key (kbd "<f6>") 'yank-more)

;; local
(add-hook 'org-mode-hook
          (lambda ()
	    (local-set-key "\M-n" 'org-demote-subtree)
            (local-set-key "\M-p" 'org-promote-subtree)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
	    (local-set-key (kbd "<f7>") 'image-new-frame-fitted)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)))
;;;;;;;;;;;;;;;;;; end local keybindings ;;;;;;

;; http://pages.sachachua.com/.emacs.d/Sacha.html#orgheadline54
  (defun yank-more ()
"Quickly make a link with label 'more'."
  (interactive)
  (insert "[[")
    (yank)
  (insert "][more]]"))


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

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

; Exclude DONE state tasks from refile targets
(defun verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'verify-refile-target)
;; END REFILE CONFIG

(setq org-use-fast-todo-selection t)

(setq org-treat-S-cursor-todo-selection-as-state-change nil)

; todo keywords list
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "green" :weight bold)
              ("DONE" :foreground "white" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "yellow" :weight bold)
              ("MEETING" :foreground "pink" :weight bold)
              ("PHONE" :foreground "pink" :weight bold))))

; includes holidays and astronomical info in agenda
(setq org-agenda-include-diary t)



; - Moving a task to =CANCELLED= adds a =CANCELLED= tag
; - Moving a task to =WAITING= adds a =WAITING= tag
; - Moving a task to =HOLD= adds =WAITING= and =HOLD= tags
; - Moving a task to a done state removes =WAITING= and =HOLD= tags
; - Moving a task to =TODO= removes =WAITING=, =CANCELLED=, and =HOLD= tags
; - Moving a task to =NEXT= removes =WAITING=, =CANCELLED=, and =HOLD= tags
; - Moving a task to =DONE= removes =WAITING=, =CANCELLED=, and =HOLD= tags
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

; (setq org-directory "~/Dropbox/org")

(setq org-default-notes-file "~/Dropbox/org/refile.org")

;; makes org open local links with emacs
(add-to-list 'org-file-apps '(directory . emacs))


;; make text pretty (lambda, etc.)
;; (setq org-pretty-entities t)

;; cleaner indentation
(setq org-startup-indented t)

;; hide stars, MAYBE UNNECESSARY
(setq org-hide-leading-stars t)

;; make *bold* look plain, like bold
(setq org-hide-emphasis-markers t)

;; path to plantuml.jar
(setq org-plantuml-jar-path "~/eclipse/java-mars/Eclipse.app/Contents/Eclipse/configuration/org.eclipse.osgi/501/0/.cp/lib/plantUml/plantuml.jar")

;; C-c C-w (refile command) by default only looks at top level headers
;  setting maxlevel to 4 allows it to look further into files
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 4))))


(setq org-completion-use-ido t)

(defun display-inline-images ()
  "Display images in buffer."
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;; org-deadline-warning-days specifies how many days fore agenda shows warning
;  default is 14
;  (setq org-deadline-warning-days 30)

(add-hook 'org-babel-after-execute-hook 'display-inline-images 'append)

; (require 'ob-tcl)
;; source code languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . true)
   (python . true)
   (emacs-lisp . true)
   (calc . true)
;   (tcl . true)
   (C . true)
   (clojure . true)
;   (dot . true)
;   (R . true)
;   (ruby . true)
   (gnuplot . true)
   (octave . true)
;   (clojure . true)
;   (ledger . true)
   (latex . t)))


;; make org-mode default mode for .txt files
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

;; recursively include all org files from a directory into the agenda
;  Nice command to have around: <M-x org-edit-agenda-file-list>
;  http://orgmode.org/worg/org-faq.html
;  ((?)) http://thread.gmane.org/gmane.emacs.orgmode/8992
;;;; KEEP AROUND ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-agenda-files
;;       (mapcar 'abbreviate-file-name
;;               (split-string
;;                (shell-command-to-string
;; 		"find ~/Dropbox/org -name \"*.org\"")
;; 	       "\n")))
;;;; KEEP AROUND ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; follow link with return
(setq org-return-follows-link t)



;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

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


; (setq org-upcoming-deadline (:background "black"))

;; Use sticky agenda's so they persist
(setq org-agenda-sticky t)

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-timestamp-if-done t)


;; load capture templates
(load "~/.emacs.d/ek_el_files/ek-org-capture-templates.el")

(setq org-fontify-whole-heading-line t)
(provide 'ek-org)
;;; org.el ends here

