;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

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


(provide 'ek-org-todo-etc-tags)
;;; ek-org-todo-etc-tags.el ends here
