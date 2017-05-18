
;; (setf initial-buffer-choice (lambda () (dired "~/")))

;; midnight mode purges buffers which haven't been displayed in 3 days
;;
(require 'midnight)
(setq midnight-mode 't)
