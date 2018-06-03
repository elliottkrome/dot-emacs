(use-package tldr
  :ensure t
  :config
  (progn
    (setq tldr-directory-path (expand-file-name "tldr" ek/hidden-directory)
	  tldr-use-word-at-point t)))


