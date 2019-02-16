(use-package ess-site
  :ensure ess
  :commands (inferior-ess-mode ess-help-mode)
  :init
  (setq inferior-R-args "--quiet")
  (setq inferior-R-program-name "/usr/local/bin/R")

  :config
  (bind-key "C-c C-w" nil inferior-ess-mode-map))
