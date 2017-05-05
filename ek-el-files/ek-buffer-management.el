
;; (setf initial-buffer-choice (lambda () (dired "~/")))

;reload setup everytime emacs opens
;(desktop-save-mode 1)

;midnight mode purges buffers which haven't been displayed in 3 days

(require 'midnight)
(setq midnight-mode 't)
