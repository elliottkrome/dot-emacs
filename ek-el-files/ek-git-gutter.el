

(let ((package-name (if (display-graphic-p)
                        "git-gutter-fringe"
                      "git-gutter")))
  (eval `(use-package ,package-name
	   :ensure t
	   :diminish git-gutter-mode
	   :init (global-git-gutter-mode nil))))



