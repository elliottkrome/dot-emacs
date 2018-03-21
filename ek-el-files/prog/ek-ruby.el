(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(defun inf-ruby-remote (remote)
  "Run an inferior Ruby process on a remote server."
  (interactive "sHost: ")
  (let ((default-directory (format "/ssh:%s:/opt/ruby2.0/embedded/bin" remote)))
    (run-ruby "/opt/ruby2.0/embedded/bin/irb" (format "%s:ruby" remote))))

(use-package smartparens
  :ensure t
  :diminish (smartparens-mode .  "()")
  :init
    (use-package smartparens-ruby)
    (add-hook 'ruby-mode-hook 'smartparens-strict-mode))

(use-package rubocop
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  :diminish rubocop-mode)
