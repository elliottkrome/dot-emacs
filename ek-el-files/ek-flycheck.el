

(defun ek-setup-flycheck-for-pyflakes-if-conda-found ()
  "If we are able to find the anaconda package manager `conda', then we will use it to install pyflakes.  If this is successful, return true.  This return true value should then be used (outside of this function)to decide whether to use the package flycheck-pyflakes."
  (if (executable-find "conda")
      (progn
	(if (not (executable-find "pyflakes"))
	    (shell-command-to-string "conda install pyflakes") t))))


(use-package flycheck
  :ensure t
  :commands global-flycheck-mode
  :diminish t
  :config
  (progn
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (setq flycheck-standard-error-navigation nil)
    (if (ek-setup-flycheck-for-pyflakes-if-conda-found)
	(use-package flycheck-pyflakes
	  :diminish t
	  :ensure t))))
(global-flycheck-mode)
