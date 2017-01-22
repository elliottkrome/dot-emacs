;;; package --- Summary
;;; Commentary:
;; f7 is bound to toggle omit mode
;;; Code:


(require 'dired-x)
(setq-default dired-omit-files-p t)
(setq dired-omit-files "^\\.?#\\|^\\.DS_store")
(eval-after-load 'dired
  '(define-key dired-mode-map [f7] 'dired-omit-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make dired less verbose
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-verbosity '(links))
;; end make dired less verbose? ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'dired)
;;; dired.el ends here
