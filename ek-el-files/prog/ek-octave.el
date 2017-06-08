(use-package octave
  :ensure t
  :mode "\\.m\\'"

  :init
  (progn
    (if (not window-system)
        (progn
          (company-quickhelp-mode 0)
          ))
    (setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

    (defun company-octave (command &optional arg &rest args)
      "`company-mode' backend using `completion-at-point-functions'."
      (interactive (list 'interactive))
      (if (eq command 'doc-buffer)
          ;; TODO `octave-help' displays the help buffer, we'd rather use a function
          ;; that doesn't display the help buffer
          (save-window-excursion
            (ignore-errors
              (octave-help arg)
              (get-buffer octave-help-buffer)))
        (apply #'company-capf command arg args)))
    (defun my-octave-mode-hook ()
      (progn
	(add-to-list 'company-backends 'company-octave)
	(lambda ()
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x)
                (font-lock-mode 1)))))

    (add-hook 'octave-mode-hook 'my-octave-mode-hook)
    )
  :config
  (bind-keys :map octave-mode-map
	     ("C-c ;" . iedit-mode))
  )



(autoload 'octave-mode "octave-mod" nil t)
