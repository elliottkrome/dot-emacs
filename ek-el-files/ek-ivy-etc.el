
(use-package counsel
    :ensure t
    :bind
    (("M-x" . counsel-M-x)
     ("M-y" . counsel-yank-pop)
     :map ivy-minibuffer-map
     ("M-y" . ivy-next-line)))

   (use-package swiper
     :diminish ivy-mode
     :ensure t
     :bind*
     (("C-s" . swiper)
      ("C-c C-r" . ivy-resume)
      ("C-x C-f" . counsel-find-file)
      ("C-c h f" . counsel-describe-function)
      ("C-c h v" . counsel-describe-variable)
      ("C-c i u" . counsel-unicode-char)
      ("M-i" . counsel-imenu)
      ("C-c g" . counsel-git)
      ("C-c j" . counsel-git-grep)
      ("C-c k" . counsel-ag)
;;      ("C-c l" . scounsel-locate)
)
     :config
     (progn
       (ivy-mode 1)
       (setq ivy-use-virtual-buffers t)
       (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)
       (ivy-set-actions
        'counsel-find-file
        '(("d" (lambda (x) (delete-file (expand-file-name x)))
           "delete"
           )))
       (ivy-set-actions
        'ivy-switch-buffer
        '(("k"
           (lambda (x)
             (kill-buffer x)
             (ivy--reset-state ivy-last))
           "kill")
          ("j"
           ivy--switch-buffer-other-window-action
           "other window")))))

  (use-package counsel-projectile
    :ensure t
    :config
    (progn
      (counsel-projectile-mode)
      (defun ek/counsel-ag-project-at-point ()
	 "use counsel ag to search for the word at point in the project"
	 (interactive)
	 (counsel-ag (thing-at-point 'symbol) (projectile-project-root)))))

  (use-package ivy-hydra :ensure t)
