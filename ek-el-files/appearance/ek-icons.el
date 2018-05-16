(when (display-graphic-p)
  (use-package all-the-icons
    :ensure t
    :config
    (cond
     ((string-equal system-type "darwin")
      (if (not (file-exists-p
		(concat (getenv "HOME") "/Library/Fonts/all-the-icons.ttf")))
	  (all-the-icons-install-fonts "t"))))
    (use-package spaceline-all-the-icons
      :after spaceline
      :config
      (spaceline-all-the-icons-theme)
      (spaceline-all-the-icons--setup-git-ahead))
    (use-package all-the-icons-dired
      :ensure t
      :init (progn
	      (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)))
    ))

;; XXX https://github.com/domtronn/all-the-icons.el/issues/99
;; May 2018
;;
(defun HACK-icons-dired-mode-setup ()
  "show less information in dired buffers"
  (font-lock-mode 0))
(add-hook 'dired-mode-hook 'HACK-icons-dired-mode-setup)
