(setq clang-executable "usr/bin/clang++")

;; (add-to-list 'load-path
;; 	     (expand-file-name "clangcheck.el" 'user-emacs-directory )) ;; if you installed manually

;; (defun my-select-clangcheck-for-checker ()
;;   "Select clang-check for flycheck's checker."
;;   (flycheck-set-checker-executable 'c/c++-clangcheck
;;                                    "/path/to/clang-check")
;;   (flycheck-select-checker 'c/c++-clangcheck))

;; (add-hook 'c-mode-hook #'my-select-clangcheck-for-checker)
;; (add-hook 'c++-mode-hook #'my-select-clangcheck-for-checker)

;; ;; enable static analysis
;; (setq flycheck-clangcheck-analyze t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/coldnew/coldnew-emacs
(setq qt-base-directory "~/Qt")
(setq qt-include-directory
      (expand-file-name "5.8/clang_64/lib/QtCore.framework/Headers"
			qt-base-directory))

(let ((flycheck-qt-include-path-prefix qt-include-directory))
  (when (file-exists-p flycheck-qt-include-path-prefix)
      (setq flycheck-clang-include-path
            (append
             (mapcar (lambda (include-dirs) (concat "" include-dirs))
                     (directory-files flycheck-qt-include-path-prefix t "\\w+"))
             (split-string flycheck-qt-include-path-prefix)))
      (setq flycheck-clang-custom-flags (split-string "-fPIC"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
