(unless (package-installed-p 'rainbow-delimiters)
    (package-refresh-contents)
    (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; https://hbfs.wordpress.com/2010/03/02/adding-keywords-in-emacs/
;; (defun add-custom-keyw()
;;   "Add to major mode hook to provide add font-lock stuff for that mode."
;;   (font-lock-add-keywords
;;    nil
;;    `(("\\(lambda\\>\\)"
;;       (0 (progn (compose-region
;; 		 (match-beginning 1)
;; 		 (match-end 1)
;; 		 ,(make-char 'greek/iso8859-7 107))
;; 		nil))))
;;    `(("\\(np.pi\\>\\)"
;;       (0 (progn (compose-region
;; 		 (match-beginning 1)
;; 		 (match-end 1)
;; 		 ,(make-char 'greek/iso8859-7 112))
;; 		nil))))
;;    ))

;; (add-hook 'python-mode-hook 'add-custom-keyw)
;; (add-hook 'elisp-mode-hook 'add-custom-keyw)
