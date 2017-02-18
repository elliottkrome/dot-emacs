(let ((package-name (if (display-graphic-p)
                        "git-gutter-fringe"
                      "git-gutter")))
  (eval `(use-package ,package-name
    :ensure t
    :init (global-git-gutter-mode))))

