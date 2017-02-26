;;; package --- Summary
;;; Commentary:
;;; Code:

(use-package dired-x
  :init
  (progn
    ;; allow editing file permissions
    (setq wdired-allow-to-change-permissions t)
    (setq-default dired-omit-files-p t)
    (setq dired-omit-files "^\\.?#\\|^\\.DS_store")

    (use-package ls-lisp
    :init
    (progn
      (setq ls-lisp-use-insert-directory-program nil)
      (setq ls-lisp-verbosity '(links))))))

;;; dired.el ends here
