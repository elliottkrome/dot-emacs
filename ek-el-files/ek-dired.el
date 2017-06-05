(add-hook 'dired-mode-hook 'auto-revert-mode)

;; allow editing file permissions
(setq wdired-allow-to-change-permissions t)

(setq-default dired-omit-files-p t)

(setq dired-omit-files
      "^\\.?#\\|^\\.DS_Store\\|^auto-save-list\\|^backups"
      dired-omit-verbose nil)

;; lets us use set flags to ls for dired (to make it less verbose)
;;
(use-package ls-lisp
  :init
  (progn
    (setq ls-lisp-use-insert-directory-program nil ;; should make work on
	                                           ;; Windows
	  ls-lisp-verbosity '(links))        ;; decrease dired's verbosity
    ))

(use-package dired-x
  :init
  (progn
    ;; https://oremacs.com/2017/03/18/dired-ediff/ ;;;;;;;;;;;;;;;;;; **
    (defun elk-ediff-for-dired ()
      (interactive)
      (let ((files (dired-get-marked-files))
	    (wnd (current-window-configuration)))
	(if (<= (length files) 2)
	    (let ((file1 (car files))
		  (file2 (if (cdr files)
			     (cadr files)
			   (read-file-name
			    "file: "
			    (dired-dwim-target-directory)))))
	      (if (file-newer-than-file-p file1 file2)
		  (ediff-files file2 file1)
		(ediff-files file1 file2))
	      (add-hook 'ediff-after-quit-hook-internal
			(lambda ()
			  (setq ediff-after-quit-hook-internal nil)
			  (set-window-configuration wnd))))
	  (error "No more than 2 files should be marked"))))))
    ; (define-key dired-mode-map "e" 'elk-ediff-for-dired)

;; lets us easily preview images from a dired buffer
;;
(use-package peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :init
  (progn
    (setq peep-dired-cleanup-on-disable t ;; kill opened buffers after disabling
	                                  ;; peep dired
	  ;; peep-dired-cleanup-eagerly t ;;  kill image buffer immediately
				          ;;  after navigating to another entry
	  peep-dired-enable-on-directories t ;; dired buffers that were peeped
					     ;; have peep dired enabled
	  peep-dired-ignored-extensions '("mkv" "iso" "mp4") ;; files to ignore
	  ))
  :bind (:map dired-mode-map
              ("P" . peep-dired)))


(use-package dired-du
  :ensure t)
  

