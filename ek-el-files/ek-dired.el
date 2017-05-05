;;; package --- Summary
;;; Commentary:
;;; Code:


(add-hook 'dired-mode-hook 'auto-revert-mode)
;; allow editing file permissions
(setq wdired-allow-to-change-permissions t)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.?#\\|^\\.DS_store")


(use-package ls-lisp
  :init
  (progn
    (setq ls-lisp-use-insert-directory-program nil)
    (setq ls-lisp-verbosity '(links))))

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

(provide 'ek-dired)
;;; dired.el ends here
