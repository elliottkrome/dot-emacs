;; http://parbo.github.io/blog/2016/05/10/configuring-emacs-for-cpp/

(use-package irony
  :ensure t
  :config
  (unless (package-installed-p 'irony)
    (irony-mode)
    (irony-install-server))
  (use-package company-irony
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony))
  (use-package company-irony-c-headers
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony-c-headers))
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company
  :ensure t
  :init
  (global-company-mode)
  :bind (("<backtab>" . company-complete-common-or-cycle))
  :config
  (delete 'company-backends 'company-clang))

(use-package cmake-ide
  :ensure t
  :init
  (use-package semantic/bovine/gcc)
  (setq cmake-ide-flags-c++
	(append '("-std=c++11")
		(mapcar
		 (lambda (path) (concat "-I" path))
		 (semantic-gcc-get-include-paths "c++"))))
  (setq cmake-ide-flags-c
	(append
	 (mapcar (lambda (path) (concat "-I" path))
		 (semantic-gcc-get-include-paths "c"))))
  (cmake-ide-setup))
