(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "clisp -q"))
    :config
    (progn
    (add-hook
     'slime-load-hook
     #'(lambda ()
    	 (slime-setup 
    	  '(slime-fancy
    	    slime-repl
    	    slime-fuzzy))))
    (setq slime-net-coding-system 'utf-8-unix)
  
    ;; Slime and Auto-Complete
    (use-package ac-slime
      :ensure t
      :init
      (progn
    	(add-hook 'slime-mode-hook 'set-up-slime-ac)
    	(add-hook 'slime-repl-mode-hook 'set-up-slime-ac))
      :config
      (progn
    	(eval-after-load "auto-complete"
    	  '(add-to-list 'ac-modes 'slime-repl-mode)))))



; (require 'slime-autoloads)
