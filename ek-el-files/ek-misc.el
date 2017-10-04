
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
  
(setq tramp-persistency-file-name (concat ek-data-directory "tramp"))
(setq url-configuration-directory (concat ek-data-directory "url"))

(defhydra hydra-yank-pop ()
  "yank"
  ("C-y" yank nil)
  ("M-y" yank-pop nil)
  ("y" (yank-pop 1) "next")
  ("Y" (yank-pop -1) "prev")
  ("l" browse-kill-ring "list" :color blue))   ; or browse-kill-ring
(global-set-key (kbd "M-y") #'hydra-yank-pop/yank-pop)
(global-set-key (kbd "C-y") #'hydra-yank-pop/yank)
