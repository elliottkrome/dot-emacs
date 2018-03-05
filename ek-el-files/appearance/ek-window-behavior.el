
(setq frame-title-format '("%b")) ;; display buffer name in title-bar
(tool-bar-mode 0)
(scroll-bar-mode 0)
(toggle-scroll-bar 0)
(global-font-lock-mode 't)
(winner-mode 1)
(column-number-mode 1)      ;; display column number in mode line
(blink-cursor-mode 0)
(show-paren-mode t)


;; 8 pixels on the left, 0 pixels on the right
;;
(fringe-mode '(0 . 0))

(setq
 echo-keystrokes 0.05       ;; show unfinished keystrokes early.
 visible-bell t             ;; dinging noises annoy the people around me
 scroll-conservatively 1000 ;; scroll just enough to bring point into view
 inhibit-splash-screen t    ;; no splash screen
 )

(setq-default truncate-lines t)
;; (setq
;;  truncate-lines t                 ;; each line of text gets one line on the
;; 				     ;; screen (i.e., text will run off the left
;; 				     ;; instead of wrapping around onto a new line)
;;  truncate-partial-width-windows t ;; truncate lines in partial-width windows
;;  )

;; (defun highlight-selected-window ()
;;   "Highlight un-selected windows with a different background color."
;;   (walk-windows (lambda (w)
;; 		  (unless (eq w (selected-window))
;;                     (with-current-buffer (window-buffer w)
;; 		      (buffer-face-set '(:background "#000e26"))))))
;;   (buffer-face-set 'default))
;; (add-hook 'buffer-list-update-hook 'highlight-selected-window)
