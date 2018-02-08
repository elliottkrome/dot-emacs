(use-package comment-tags
  :ensure t
  :config
  (progn 
    (setq comment-tags-comment-start-only t
	  comment-tags-require-colon t
	  comment-tags-case-sensitive t
	  comment-tags-show-faces t
	  comment-tags-lighter nil
	  comment-tags-keyword-faces
	  `(("TODO" . ,(list :weight 'bold :foreground "#28ABE3"))
	    ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
	    ("BUG" . ,(list :weight 'bold :foreground "#DB3340"))
	    ("INFO" . ,(list :weight 'bold :foreground "#F7EAC8"))))
    
  (add-hook 'prog-mode-hook 'comment-tags-mode)))
