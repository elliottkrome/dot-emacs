(use-package tramp
  :config
  (setq tramp-verbose 9
        tramp-default-method "ssh"))

 (setq vc-ignore-dir-regexp
       (format "\\(%s\\)\\|\\(%s\\)"
	       vc-ignore-dir-regexp
	       tramp-file-name-regexp))
