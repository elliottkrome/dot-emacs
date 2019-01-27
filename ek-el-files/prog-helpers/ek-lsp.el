
;; options include irony, cquery, rtags, ggtags, and ycmd
(use-package lsp-mode
  :ensure t
  :commands lsp
  :custom-face
  (lsp-face-highlight-read    ((t (:background "#DC322F"))))  ; Solarized Red
  (lsp-face-highlight-write   ((t (:background "#2AA198")))) ; Solarized Cyan
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
                    :major-modes '(python-mode)
                    :server-id 'pyls))
  (setq lsp-print-io t
        )
  )


(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . lsp-ui-mode))


(use-package company-lsp
  :ensure t
  :after (cquery company lsp-mode)
  :custom (company-lsp-enable-recompletion t)
  :config (add-to-list 'company-backends 'company-lsp))

(use-package ivy-xref
  :ensure t
  :after ivy
  :custom (xref-show-xrefs-function #'ivy-xref-show-xrefs))
