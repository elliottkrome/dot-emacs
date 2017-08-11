
(fset 'yes-or-no-p 'y-or-n-p)

(setq savehist-file
      (concat ek-data-directory "history"))

;; don't let the cursor go into minibuffer prompt
;;  http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
(setq minibuffer-prompt-properties
      (quote
       (read-only t
		  point-entered
		  minibuffer-avoid-prompt
		  face minibuffer-prompt)))
(defun ek-switch-to-scratch ()
  "Switch to the scratch buffer."
  (switch-to-buffer
   (get-buffer-create "*scratch*")))
  


;; Open files in dired mode using 'open'
;; bound to "z" in dired
;;
(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "z")
       (lambda () (interactive)
         (let ((fn (dired-get-file-for-visit)))
           (start-process "default-app" nil "open" fn))))))
