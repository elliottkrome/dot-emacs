(add-hook 'dired-mode-hook 'auto-revert-mode)

;; allow editing file permissions
(setq wdired-allow-to-change-permissions t)

(setq-default dired-omit-files-p t)

(setq dired-omit-files
      "^\\.?#\\|^\\.DS_Store\\|^auto-save-list\\|^backups"
      dired-omit-verbose nil)

;; lets us use set flags to ls for dired (to make it less verbose)
;;
(use-package ls-lisp
  :init
  (progn
    (setq ls-lisp-use-insert-directory-program nil ;; should make work on
	                                           ;; Windows
	  ls-lisp-verbosity '(links))        ;; decrease dired's verbosity
    ))

(use-package dired-x
  :init
  (progn
    ;; https://oremacs.com/2017/03/18/dired-ediff/ ;;;;;;;;;;;;;;;;;; **
    (defun elk-ediff-for-dired ()
      (interactive)
      (let ((files (dired-get-marked-files))
	    (wnd (current-window-configuration)))
	(if (<= (length files) 2)
	    (let ((file1 (car files))
		  (file2 (if (cdr files)
			     (cadr files)
			   (read-file-name
			    "file: "
			    (dired-dwim-target-directory)))))
	      (if (file-newer-than-file-p file1 file2)
		  (ediff-files file2 file1)
		(ediff-files file1 file2))
	      (add-hook 'ediff-after-quit-hook-internal
			(lambda ()
			  (setq ediff-after-quit-hook-internal nil)
			  (set-window-configuration wnd))))
	  (error "No more than 2 files should be marked"))))))
    ; (define-key dired-mode-map "e" 'elk-ediff-for-dired)

;; lets us easily preview images from a dired buffer
;;
(use-package peep-dired
  :ensure t
  :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
  :init
  (progn
    (setq peep-dired-cleanup-on-disable t ;; kill opened buffers after disabling
	                                  ;; peep dired
	  ;; peep-dired-cleanup-eagerly t ;;  kill image buffer immediately
				          ;;  after navigating to another entry
	  peep-dired-enable-on-directories t ;; dired buffers that were peeped
					     ;; have peep dired enabled
	  peep-dired-ignored-extensions '("mkv" "iso" "mp4") ;; files to ignore
	  ))
  :bind (:map dired-mode-map
              ("P" . peep-dired)))


(use-package dired-du
  :ensure t)

(defun xah-open-in-external-app ()
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2016-10-15"
  (interactive)
  (let* (
         ($file-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" $fpath t t))) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))
  
(defhydra hydra-dired (:hint nil :color pink)
  "
_+_ mkdir          _v_iew         _m_ark             _(_ details        _i_nsert-subdir    wdired
_C_opy             _O_ view other _U_nmark all       _)_ omit-mode      _$_ hide-subdir    C-x C-q: edit
_D_elete           _o_pen other   _u_nmark           _l_ redisplay      _w_ kill-subdir    C-c C-c : commit
_R_ename           _M_ chmod      _t_oggle           _g_ revert buf     _e_ ediff          C-c ESC : abort
_Y_ rel symlink    _G_ chgrp      _E_xtension mark   _s_ort             _=_ pdiff
_S_ymlink     open _E_xternal     _F_ind marked      _._ toggle hydra   \\ flyspell
_r_sync            _X_shell cmnd  ^ ^                ^ ^                _?_ summary
_z_ compress-file  _A_ find regexp
_Z_ compress       _Q_ repl regexp

T - tag prefix
"
  ("\\" dired-do-ispell)
  ("(" dired-hide-details-mode)
  (")" dired-omit-mode)
  ("+" dired-create-directory)
  ("=" diredp-ediff)         ;; smart diff
  ("?" dired-summary)
  ("$" diredp-hide-subdir-nomove)
  ("A" dired-do-find-regexp)
  ("C" dired-do-copy)        ;; Copy all marked files
  ("D" dired-do-delete)
  ("E" dired-mark-extension)
  ("e" dired-ediff-files)
  ("F" dired-do-find-marked-files)
  ("G" dired-do-chgrp)
  ("g" revert-buffer)        ;; read all directories again (refresh)
  ("i" dired-maybe-insert-subdir)
  ("l" dired-do-redisplay)   ;; relist the marked or singel directory
  ("M" dired-do-chmod)
  ("m" dired-mark)
  ("O" dired-display-file)
  ("o" dired-find-file-other-window)
  ("Q" dired-do-find-regexp-and-replace)
  ("R" dired-do-rename)
  ("r" dired-do-rsynch)
  ("S" dired-do-symlink)
  ("s" dired-sort-toggle-or-edit)
  ("t" dired-toggle-marks)
  ("U" dired-unmark-all-marks)
  ("u" dired-unmark)
  ("v" dired-view-file)      ;; q to exit, s to search, = gets line #
  ("w" dired-kill-subdir)
  ("Y" dired-do-relsymlink)
  ("z" diredp-compress-this-file)
  ("Z" dired-do-compress)
  ("E" xah-open-in-external-app)
  ("X" dired-do-shell-command)
  ("q" nil)
  ("." nil :color blue))

(define-key dired-mode-map "." 'hydra-dired/body)
