(use-package lua-mode
  :ensure t
  :config
  (defun ek-lua-send-region-or-current-line ()
    "Send current region or line to lua process."
    (interactive)
    (if (region-active-p)
        (lua-send-region (region-beginning) (region-end))
      (lua-send-current-line)))
  (bind-keys :map lua-mode-map
             ("C-c C-d" . lua-send-proc)
             ("C-c C-c" . ek-lua-send-region-or-current-line)
             ("C-c C-p" . lua-start-process))
  (use-package company-lua
    :ensure t
    :after company
    :init
    (defun ek-lua-mode-company-init ()
      (setq-local company-backends '((company-lua
                                      company-etags
                                      company-dabbrev-code
                                      company-yasnippet))))
    (add-hook 'lua-mode-hook #'ek-lua-mode-company-init)))
