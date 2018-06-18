
(use-package counsel
    :ensure t
    :bind
    (("M-x" . counsel-M-x)
     ("M-y" . counsel-yank-pop)
     :map ivy-minibuffer-map
     ("C-s" . ivy-next-line)
     ("C-r" . ivy-previous-line)))

(use-package swiper
  :diminish ivy-mode
  :ensure t
  :bind
  (
   ; ("C-s" . swiper)
   ("C-c C-r" . ivy-resume)
   ("C-x C-f" . counsel-find-file)
   ("C-c h f" . counsel-describe-function)
   ("C-c h v" . counsel-describe-variable)
   ; ("C-c i u" . counsel-unicode-char)
   ("M-i" . counsel-imenu)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   )
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t
	  ivy-wrap                t)

    ;; this allows to decide which "read-*" (completing read stuff)
    ;; should use which regex functions.
    ;; for example, `occur' and `isearch' should not be fuzzy
    ;;
    (setq ivy-re-builders-alist
	  '(
	    (swiper . ivy--regex-plus)
	    (occur  . uvy--regex-plus)
	    (t      . ivy--regex-fuzzy))  ; sets the defualt case
	  ) 

    (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)

    (ivy-set-actions
     'counsel-find-file
     '(("d" (lambda (x) (delete-file (expand-file-name x)))
	"delete" )))

    (ivy-set-actions
     'ivy-switch-buffer
     '(("k"(lambda (x) (kill-buffer x) (ivy--reset-state ivy-last))
	"kill")
       ("j" ivy--switch-buffer-other-window-action
	"other window")))))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

(use-package ivy-yasnippet              ; Preview yasnippets with Ivy
  :ensure t
  :bind ("C-c y" . ivy-yasnippet))

(when (display-graphic-p)
  (use-package all-the-icons-ivy
    :ensure t
    :config
    (progn
      (all-the-icons-ivy-setup)
      (setq all-the-icons-ivy-file-commands '(counsel-find-file
					      counsel-file-jump
					      counsel-recentf
					      counsel-projectile-find-file
					      counsel-projectile-find-dir))))
  )

(use-package ivy-hydra :ensure t)

