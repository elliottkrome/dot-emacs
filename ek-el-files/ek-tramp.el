(use-package tramp
  :config
  (setq tramp-verbose 9
        tramp-default-method "ssh")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
)

 ;; (setq vc-ignore-dir-regexp
 ;;       (format "\\(%s\\)\\|\\(%s\\)"
 ;; 	       vc-ignore-dir-regexp
 ;; 	       tramp-file-name-regexp))

(add-to-list 'tramp-remote-path "/home/tuf78296/git_source/build")
