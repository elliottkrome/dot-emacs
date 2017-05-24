
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
