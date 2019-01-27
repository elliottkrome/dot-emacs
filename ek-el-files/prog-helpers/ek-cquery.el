
(use-package cquery
  :ensure t
  :commands (lsp-cquery-enable)
  :hook (c-mode-common . lsp-cquery-enable)
  :custom
  (cquery-executable (ek/which "cquery"))
  (cquery-extra-args '("--log-file=/tmp/cq.log")
  (cquery-extra-init-params '(:completion (:detailedLabel t)))
  ))
