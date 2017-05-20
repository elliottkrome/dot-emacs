(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (progn
    (add-hook 'after-save-hook
              (lambda ()
                (when (eql major-mode 'snippet-mode)
                  (yas-reload-all))))
    (setq yas-snippet-dirs (list (f-expand "snippets" user-emacs-directory)))
    
    ; (setq yas-indent-line 'fixed)

    ;; don't run yasnippet in terminals
    ;;
    (add-hook 'term-mode-hook (lambda()
                                (yas-minor-mode -1)))
    (yas-global-mode 1))
  :mode ("\\.yasnippet" . snippet-mode))
