(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(delete 'company-backends 'company-clang)

(use-package cmake-ide
  :ensure t
  :init
  (use-package rtags
    :ensure t)
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

