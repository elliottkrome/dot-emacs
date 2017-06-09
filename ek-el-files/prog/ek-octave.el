(use-package octave
  :ensure t
  :mode "\\.m\\'"
  :config
  (progn

    ;; override the built-in mapping to be consistent with other modes
    ;;
    (bind-keys :map octave-mode-map
	       ("C-c ;" . iedit-mode))

    (setq inferior-octave-buffer       "*Octave*"
	  inferior-octave-mode-hook    nil
	  inferior-octave-program      "/usr/local/bin/octave-cli-4.2.1"
	  inferior-octave-startup-args '("-i" "--no-line-editing" "--no-gui")
	  octave-block-offset          2)

    ;; company-quickelp mode seems to cause problems in the terminal
    ;;
    (if (not window-system)
	(company-quickhelp-mode 0))

    ;; open .m files in octave mode
    ;;
    (setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

    ;; create an octave backend function for company
    ;;
    (defun company-octave (command &optional arg &rest args)
      "`company-mode' backend using `completion-at-point-functions'."
      (interactive (list 'interactive))
      (if (eq command 'doc-buffer)
	  (save-window-excursion
	    (ignore-errors
	      (octave-help arg)
	      (get-buffer octave-help-buffer)))
	(apply #'company-capf command arg args)))

    ;; create a hood to add to octave-mode hook
    ;;
    (defun my-octave-mode-hook ()
      (progn
	(add-to-list 'company-backends 'company-octave)
	(lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1)))))

    ;; add customized hook to octave-mode-hook
    ;;
    (add-hook 'octave-mode-hook 'my-octave-mode-hook))
 )

; (autoload 'octave-mode "octave-mod" nil t)
