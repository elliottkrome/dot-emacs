;; (not a great use of time)
;; aesthetics - just playing with some frame appearance stuff
;;

(setq ek/opt-1 `((scroll-bar-background . "gray54") ; emacs-mac build lets you color toolbar ("gray55" works well with dark-mode on mac, "Palevioletred3" is fun)
		 (background-color      . "gray13")
		 (alpha                 . (100 . 100))
		 (scroll-bar-width      . 0))
      default-frame-alist (copy-alist initial-frame-alist))

(setq ek/opt-2 `((scroll-bar-background . "Palevioletred3") ; emacs-mac build lets you color toolbar ("gray55" works well with dark-mode on mac, "Palevioletred3" is fun)
		 (alpha                 . (100 . 100))
		 (scroll-bar-width      . 0))
      default-frame-alist (copy-alist initial-frame-alist))


(if (eq system-type 'darwin)
    (progn
      (setq initial-frame-alist ek/opt-2
	    mac-use-title-bar nil)))

(setq line-spacing 0)
;; i think this was the first non-trivial elisp i ever messed around
;; with. i'm keeping it around for nostalgia's sake.
;;
;; (defun highlight-selected-window ()
;;   "Highlight un-selected windows with a different background color."
;;   (walk-windows (lambda (w)
;; 		  (if (not (eq w (minibuffer-window)))
;; 		      (unless (eq w (selected-window))
;; 			(with-current-buffer (window-buffer w)
;; 			  (buffer-face-set '(:background "gray12")))))))
;;   (buffer-face-set 'default))
;; (add-hook 'buffer-list-update-hook 'highlight-selected-window)

