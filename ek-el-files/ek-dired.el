;;; package --- Summary
;;; Commentary:
;;; Code:


(add-hook 'dired-mode-hook 'auto-revert-mode)

;; allow editing file permissions
(setq wdired-allow-to-change-permissions t)

(setq-default dired-omit-files-p t)

(setq dired-omit-files
      "^\\.?#\\|^\\.DS_Store\\|^auto-save-list\\|^backups"
      dired-omit-verbose nil)

(use-package ls-lisp
  :init
  (progn
    (setq ls-lisp-use-insert-directory-program nil)
    (setq ls-lisp-verbosity '(links))))
(defmacro image-view (direction)
  `(lambda ()
     (interactive)
     (quit-window)
     (let ((pt (point))
           filename)
       (or (ignore-errors
             (catch 'filename
               (while (dired-next-line ,direction)
                 (when (image-type-from-file-name
                        (setq filename (dired-get-filename)))
                   (throw 'filename filename)))))
           (goto-char pt))
       (dired-view-file))))

(eval-after-load "image-mode"
  '(progn
    (define-key image-mode-map "n" (image-view 1))
    (define-key image-mode-map "h" (image-view -1))))

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
(use-package peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :bind (:map dired-mode-map
              ("P" . peep-dired)))
(provide 'ek-dired)
;;; dired.el ends here
