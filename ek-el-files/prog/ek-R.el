(use-package ess-site
  :ensure ess
  :commands (inferior-ess-mode ess-help-mode)
  :init
  (setq inferior-R-args "--quiet")

  :config
  (bind-key "C-c C-w" nil inferior-ess-mode-map))


  :disabled t
( use-package ess-site
	:ensure ess
	:init
	(setq inferior-R-program-name "/usr/local/bin/R")
	(setq ess-ask-for-ess-directory nil))
