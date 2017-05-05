(use-package eziam-theme
  :ensure t
  :defer t
  :init
  (load-theme 'eziam-dark t))

; (load-theme 'leuven t)   
(tool-bar-mode 0)
(scroll-bar-mode 0)




;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

(toggle-scroll-bar -1)


(add-to-list 'default-frame-alist '(font . "Source Code Pro" ))
(setq visible-bell t)

;; don't let the cursor go into minibuffer prompt
;;  http://ergoemacs.org/emacs/emacs_stop_cursor_enter_prompt.html
(setq minibuffer-prompt-properties
      (quote
       (read-only t
		  point-entered
		  minibuffer-avoid-prompt
		  face minibuffer-prompt)))

(defun highlight-selected-window ()
  "Highlight un-selected windows with a different background color."
  (walk-windows (lambda (w)
		  (unless (eq w (selected-window))
                    (with-current-buffer (window-buffer w)
		      (buffer-face-set '(:background "#000e26"))))))
  (buffer-face-set 'default))
(add-hook 'buffer-list-update-hook 'highlight-selected-window)

(global-font-lock-mode 't)

(winner-mode 1)

(setq scroll-conservatively 10000)

;; (use-package hl-line
;;   :ensure t
;;   :config (set-face-background 'hl-line "#073642"))


;; display column number in mode line
(column-number-mode 1)

;; no splash screen
(setq inhibit-splash-screen t)

; (set-fringe-mode t)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
;(setq truncate-lines t)
; truncate lines even in partial-width windows
;(setq truncate-partial-width-windows t)

(require 'paren)
(show-paren-mode t)

;; font-lock: Use lambda for anonymous functions
(font-lock-add-keywords
 'python-mode `(("\\(lambda\\>\\)"
                 (0 (progn (compose-region
			    (match-beginning 1)
			    (match-end 1)
                           ,(make-char 'greek-iso8859-7 107))
			   nil)))))
(font-lock-add-keywords
 'emacs-lisp-mode `(("\\(lambda\\>\\)"
		     (0 (progn (compose-region
				(match-beginning 1)
				(match-end 1)
                               ,(make-char 'greek-iso8859-7 107))
			       nil)))))

(font-lock-add-keywords
 'python-mode `(("\\(np.pi\\>\\)"
		 (0 (progn (compose-region
			    (match-beginning 1)
			    (match-end 1)
			    ,(make-char 'greek-iso8859-7 112))
			   nil)))))

(visual-line-mode)

(blink-cursor-mode 0)
(provide 'window_behavior)
;;; window_behavior.el ends here