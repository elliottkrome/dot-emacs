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
	      (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))
      )
    )
  )
