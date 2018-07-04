;; options include irony, cquery, rtags, ggtags, and ycmd
(use-package lsp-mode
  :ensure t
  :defer t
  :custom-face
  (lsp-face-highlight-textual ((t (:background unspecified))))
  ;; Solarized Red
  (lsp-face-highlight-read ((t (:background "#DC322F"))))
  ;; Solarized Cyan
  (lsp-face-highlight-write ((t (:background "#2AA198")))))

(use-package lsp-ui
  :ensure t
  
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))

(use-package cquery
  :ensure t
  :commands (lsp-cquery-enable)
  :hook (c-mode-common . lsp-cquery-enable)
  :custom
  (cquery-executable  ; (shell-command-to-string "which cquery"))
  (cquery-extra-init-params '(:completion (:detailedLabel t))))

(use-package company-lsp
  :after (cquery company lsp-mode)
  :custom (company-lsp-enable-recompletion t)
  :config (add-to-list 'company-backends 'company-lsp))

(use-package ivy-xref
  :after ivy
  :custom (xref-show-xrefs-function #'ivy-xref-show-xrefs))

which cquery
