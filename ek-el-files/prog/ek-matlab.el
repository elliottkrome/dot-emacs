;; http://sourceforge.net/projects/matlab-emacs/
;; (use-package matlab                     ; Major mode for MATLAB(R) dot-m files
;;   :ensure matlab-mode
;;   :mode ("\\.m$" . matlab-mode)
;;   :commands (matlab-shell)
;;   :config
;;   (setq matlab-shell-command "matlab")
;;   (setq matlab-shell-command-switches '("-nodesktop" "-nosplash"))

;;   ;; Don't switch to figure window
;;   (setenv "WINDOWID" (frame-parameter (selected-frame) 'outer-window-id))

;;   (setq-default matlab-change-current-directory t)
;;   (setq-default matlab-functions-have-end t)
;;   (setq-default matlab-indent-function-body 'guess)

;;   (add-hook 'matlab-mode-hook #'matlab-mode-preferences)

;;   (defun matlab-shell-fix-slowness ()
;;     (remove-hook 'comint-output-filter-functions 'matlab-shell-render-html-anchor t)
;;     (remove-hook 'comint-output-filter-functions 'matlab-shell-render-errors-as-anchor t))

;;   (add-hook 'matlab-shell-mode-hook #'matlab-shell-fix-slowness))

(use-package matlab-mode
  :ensure t
  :mode ("\\.m$" . matlab-mode)
  )

(setq matlab-shell-command
       "/Applications/MATLAB_R2018a.app/bin/matlab")

(customize-set-variable 'matlab-shell-command
"/Users/elk/Dropbox/ddrop/bin/matlab_wrapper_for_emacs_00.sh")

;; setup matlab in babel
(setq org-babel-default-header-args:matlab
  '((:results . "output") (:session . "*MATLAB*")))

;; list of babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((matlab . t)
   ))

