
(use-package doom-themes
  :ensure t
  :init
  (progn

    (setq doom-themes-enable-bold t    ; if nil, bold universally disabled
	  doom-themes-enable-italic t  ; if nil, italics universally disabled

	  
	  doom-one-brighter-modeline nil ;; doom-one specific settings
	  doom-one-brighter-comments nil);; doom-one  ||

    ;; Load the theme (doom-one, doom-dark, etc.)
    (load-theme 'doom-one t)


    ;; brighter source buffers (that represent files)
    (add-hook 'find-file-hook #'doom-buffer-mode-maybe)
    ;; if you use auto-revert-mode
    (add-hook 'after-revert-hook #'doom-buffer-mode-maybe)
    ;; And you can brighten other buffers (unconditionally) with:
    (add-hook 'ediff-prepare-buffer-hook #'doom-buffer-mode)

    ;; brighter minibuffer when active
    (add-hook 'minibuffer-setup-hook #'doom-brighten-minibuffer)

    ;; Enable nlinum line highlighting
    (doom-themes-nlinum-config)   ; requires nlinum and hl-line-mode)
    ))

