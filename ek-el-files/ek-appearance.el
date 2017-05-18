(use-package eziam-theme
  :ensure t
  :defer t
  :init
  (load-theme 'eziam-dark t))

; (load-theme 'leuven t)   

;; Spaceline - A mode line
(use-package spaceline
  :ensure spaceline)

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme))
(add-to-list 'default-frame-alist '(font . "Source Code Pro" ))

;; font-lock: Use lambda for anonymous functions
(font-lock-add-keywords
 'python-mode `(("\\(lambda\\>\\)"
                 (0 (progn (compose-region
			    (match-beginning 1)
			    (match-end 1)
                           ,(make-char 'greek-iso8859-7 107))
			   nil)))))
(font-lock-add-keywords
 'emacs-lisp-mode `(("\\(lambda\\>\\)"
		     (0 (progn (compose-region
				(match-beginning 1)
				(match-end 1)
                               ,(make-char 'greek-iso8859-7 107))
			       nil)))))

(font-lock-add-keywords
 'python-mode `(("\\(np.pi\\>\\)"
		 (0 (progn (compose-region
			    (match-beginning 1)
			    (match-end 1)
			    ,(make-char 'greek-iso8859-7 112))
			   nil)))))
