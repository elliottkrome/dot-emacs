
(tool-bar-mode 0)                ;; no tool-bar
(scroll-bar-mode 0)              ;; no scroll-bar
(toggle-scroll-bar 0)            ;;  ||
(winner-mode 1)                  ;; make moving between frame layouts easy
(column-number-mode 1)           ;; display column number in mode line
(blink-cursor-mode 0)            ;; no blinky cursor
(show-paren-mode t)              ;; tell (message "message" format-args)e about partners
(fringe-mode '(0 . 0))           ;; 0 pixels on the left, 0 pixels on the right

(setq frame-title-format '("%b") ;; display buffer name in title-bar
      echo-keystrokes 0.05       ;; show unfinished keystrokes early.
      visible-bell t             ;; dinging noises annoy the people around me
      scroll-conservatively 1000 ;; scroll just enough to bring point into view
      inhibit-splash-screen t)   ;; no splash screen

;; buffer-local variable, so must use `setq-default', rather then `setq'
;;
(setq-default truncate-lines t)

;; (not a great use of time)
;; aesthetics - just playing with some frame appearance stuff
;; 
(if (eq system-type 'darwin)
    (setq initial-frame-alist `((scroll-bar-background . "PaleVioletRed3") ; "gray60" works well with dark-mode on mac
				(                alpha . (100 . 100))
				(     scroll-bar-width . 0))
	  default-frame-alist (copy-alist initial-frame-alist)))

;; i think this was the first non-trivial elisp i ever messed around
;; with. i'm keeping it around for nostalgia's sake.
;;
(defun highlight-selected-window ()
  "Highlight un-selected windows with a different background color."
  (walk-windows (lambda (w)
		  (if (not (eq w (minibuffer-window)))
		      (unless (eq w (selected-window))
			(with-current-buffer (window-buffer w)
			  (buffer-face-set '(:background "#26322e")))))))
  (buffer-face-set 'default))
(add-hook 'buffer-list-update-hook 'highlight-selected-window)
