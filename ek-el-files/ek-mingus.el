(use-package mingus
  :commands
  (mingus 
   mingus-stop
   mingus-dired-add
   mingus-dired-add-and-play)
  :ensure t
  :if (not noninteractive)
  :init (progn
	  (setq mingus-use-mouse-p    t
		mingus-use-ido-mode-p t))
  :config (progn
	    (dolist
		(keymap (list mingus-playlist-map
			 mingus-browse-map
			 mingus-help-map))
	      (define-key keymap "s" 'isearch-forward-regexp)
	      (define-key keymap "t" 'mingus-toggle)
	      (define-key keymap "n" 'next-line)
	      (define-key keymap "p" 'previous-line)

	      ;; for consistency w/ personal map
	      ;; 
	      (define-key keymap "\C-l" 'control-l-prefix))

	    (defun ek/mingus ()
	      (interactive)
	      (mingus-switch-to-playlist)
	      (mingus-playlist)
	      (mingus-goto-current-song)
	      (recenter))))
