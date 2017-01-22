
(use-package ido
  :ensure t
  :init
  (progn
    (ido-mode 1)
    (use-package ido-ubiquitous
      :ensure t
      :config
      (ido-ubiquitous-mode +1))
    (use-package ido-vertical-mode
      :ensure t
      :init (ido-vertical-mode 1))
    (use-package ido-occur
      :ensure t) 
    (use-package smex
      :ensure t
      :init (smex-initialize)
      :bind ("M-x" . smex)))

  :config
  (setq ido-enable-flex-matching               t
        ido-create-new-buffer                  'always
        ido-use-filename-at-point              'guess
        ido-max-prospects                       10
        ido-default-file-method                'selected-window
        ido-auto-merge-work-directories-length -1
	ido-everywhere                          t))

(use-package projectile
  :ensure t
  :commands (projectile-find-file projectile-switch-project)
  :diminish projectile-mode
  :config
  (projectile-global-mode))

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(defadvice smex (around space-inserts-hyphen activate compile)
  "Insert hyphen in place of whitespace when M-x-ing."
        (let ((ido-cannot-complete-command
               `(lambda ()
                  (interactive)
                  (if (string= " " (this-command-keys))
                      (insert ?-)
                    (funcall ,ido-cannot-complete-command)))))
          ad-do-it))

(eval-after-load "grep"
  '(progn
    ; (add-to-list 'grep-find-ignored-files "*.tmp")
     (add-to-list 'grep-find-ignored-directories "elpa/archives")
     (add-to-list 'grep-find-ignored-directories "elpa/pkg-info*")))

(fset 'yes-or-no-p 'y-or-n-p)

(defun smarter-move-beginning-of-line (arg)
    "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
    (interactive "^p")
    (setq arg (or arg 1))

    ;; Move lines first
    (when (/= arg 1)
      (let ((line-move-visual nil))
	(forward-line (1- arg))))

    (let ((orig-point (point)))
      (back-to-indentation)
      (when (= orig-point (point))
	(move-beginning-of-line 1))))
